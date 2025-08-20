import requests


def get_npclassifier(smiles) -> dict:
    try:    
        response = requests.get(
            f"https://npclassifier.ucsd.edu/classify?smiles={smiles}"
        )
        data = response.json()
    except:
        return {}

    metadata = {}

    if "class_results" in data and len(data["class_results"]) > 0:
        metadata["class"] = data["class_results"][0]

    if "superclass_results" in data and len(data["superclass_results"]) > 0:
        metadata["superclass"] = data["superclass_results"][0]

    if "pathway_results" in data and len(data["pathway_results"]) > 0:
        metadata["pathway"] = data["pathway_results"][0]

    if "isglycoside" in data:
        metadata["is_glycoside"] = data["isglycoside"]
    return metadata