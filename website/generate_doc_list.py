#!/usr/bin/env python3
"""
Generate a JSON file containing all documentation files for the preview page.
"""
import os
import json
from pathlib import Path

def get_module_name(name):
    """Extract the functional module name from a resource/data source name."""
    # Remove service prefixes
    prefixes = ["scdn_", "sdns_"]
    for prefix in prefixes:
        if name.startswith(prefix):
            name = name.replace(prefix, "", 1)
            break
    
    # Map resource patterns to module names (order matters - more specific first)
    patterns = [
        ("security_protection", "Security Protection"),
        ("certificate_export", "Certificate"),
        ("certificate_apply", "Certificate"),
        ("cert_binding", "Certificate"),
        ("certificate", "Certificate"),
        ("certificates", "Certificate"),
        ("origin_group", "Origin Group"),
        ("origin_groups", "Origin Group"),
        ("cache_clean", "Cache"),
        ("cache_preheat", "Cache"),
        ("cache_global_config", "Cache"),
        ("cache_rule", "Cache"),
        ("cache_rules", "Cache"),
        ("network_speed", "Network Speed"),
        ("rule_template", "Rule Template"),
        ("log_download", "Log Download"),
        ("domain_group", "Domain Group"),
        ("domain_groups", "Domain Group"),
        ("domain", "Domain"),
        ("domains", "Domain"),
        ("record", "Record"),
        ("records", "Record"),
        ("origin", "Origin"),
        ("origins", "Origin"),
    ]
    
    # Check patterns in order (most specific first)
    for pattern, module in patterns:
        if name.startswith(pattern):
            return module
    
    # Fallback: capitalize first word
    parts = name.split("_")
    if parts:
        return parts[0].capitalize()
    
    return "Other"

def get_doc_files():
    """Scan and organize all documentation files."""
    docs_dir = Path(__file__).parent / "docs"
    
    data_sources = []
    resources = []
    
    # Scan data sources
    d_dir = docs_dir / "d"
    if d_dir.exists():
        for file in sorted(d_dir.glob("*.html.markdown")):
            name = file.stem.replace(".html", "")
            data_sources.append({
                "name": name,
                "path": f"docs/d/{file.name}",
                "display_name": name.replace("_", " ")
            })
    
    # Scan resources
    r_dir = docs_dir / "r"
    if r_dir.exists():
        for file in sorted(r_dir.glob("*.html.markdown")):
            name = file.stem.replace(".html", "")
            resources.append({
                "name": name,
                "path": f"docs/r/{file.name}",
                "display_name": name.replace("_", " ")
            })
    
    # Organize by category and module
    categories = {
        "SCDN": {
            "prefix": "scdn_",
            "data_sources": [],
            "resources": [],
            "modules": {}
        },
        "SDNS": {
            "prefix": "sdns_",
            "data_sources": [],
            "resources": [],
            "modules": {}
        }
    }
    
    # Group resources by category and module
    for cat_name, cat_info in categories.items():
        prefix = cat_info["prefix"]
        
        # Process data sources
        for ds in data_sources:
            if ds["name"].startswith(prefix):
                cat_info["data_sources"].append(ds)
                module_name = get_module_name(ds["name"])
                if module_name not in cat_info["modules"]:
                    cat_info["modules"][module_name] = {
                        "data_sources": [],
                        "resources": []
                    }
                cat_info["modules"][module_name]["data_sources"].append(ds)
        
        # Process resources
        for res in resources:
            if res["name"].startswith(prefix):
                cat_info["resources"].append(res)
                module_name = get_module_name(res["name"])
                if module_name not in cat_info["modules"]:
                    cat_info["modules"][module_name] = {
                        "data_sources": [],
                        "resources": []
                    }
                cat_info["modules"][module_name]["resources"].append(res)
        
        # Convert modules dict to list for JSON serialization
        module_list = []
        for module_name in sorted(cat_info["modules"].keys()):
            module = cat_info["modules"][module_name]
            module_list.append({
                "module_name": module_name,
                "data_sources": sorted(module["data_sources"], key=lambda x: x["name"]),
                "resources": sorted(module["resources"], key=lambda x: x["name"])
            })
        
        cat_info["modules"] = module_list
        # Remove internal prefix before returning
        del cat_info["prefix"]
    
    return {
        "index": "docs/index.html.markdown",
        "categories": categories,
        "all_data_sources": data_sources,
        "all_resources": resources
    }

if __name__ == "__main__":
    doc_list = get_doc_files()
    
    # Generate JSON file
    output_file = Path(__file__).parent / "doc_list.json"
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(doc_list, f, indent=2, ensure_ascii=False)
    
    # Generate JavaScript file for faster loading
    js_file = Path(__file__).parent / "doc_list.js"
    with open(js_file, "w", encoding="utf-8") as f:
        f.write("// Auto-generated document list\n")
        f.write("// This file is generated by generate_doc_list.py\n")
        f.write("window.DOC_LIST = ")
        json.dump(doc_list, f, ensure_ascii=False)
        f.write(";\n")
    
    print(f"Generated doc_list.json and doc_list.js with {len(doc_list['all_data_sources'])} data sources and {len(doc_list['all_resources'])} resources")
