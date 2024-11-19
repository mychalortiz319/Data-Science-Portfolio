# BrainStation Data Science Capstone Template

This is a template repository for setting up your capstone project: it includes a simple folder structure and placeholder files for the most important assets you will be creating.

## Usage

1. Start a new GitHub repo using this template.
2. Update your `LICENSE` file with date and owner.
3. Update your `README.md` file to reflect the project - see a sample structure below and please refer to Synapse on what needs to be included here. 
4. Set up and activate your conda environment:
    - Create a new `conda` environment for your capstone project.
    - Activate the environment and export:
        ```bash
        conda env export > conda.yml
        ```
    - Make sure re-export every time after you update the environment.
    - You can reset your conda environment by running:
        ```bash
        conda env create -f conda.yml
        conda activate <your-env-name>
        ```
5. Add your own notebooks in `./notebooks/` and remove placeholders.
6. Add your own data in `./data/` and remove placeholder. Note: `.gitignore` will ignore the data folder when you push to github, save a copy of your raw and processed data, pickled models in a Google Drive folder and add the link in the `data_links.md` file.
7. Add your project documents, figures, reports, presentation pdf's in the `./docs` and remove placeholders.
8. Add your references (tutorials, papers, books etc.) in `./references`. 
9. Add your own scripts in `./src/` and remove unnecessary folders.

Feel free to rename the folder and customize the project structure to best fit your work - this template is just the starting point.

------------------------------------------------------------------------------

## Project Title
=========================

### Executive Summary

Problem Area
Fantasy football has become increasingly popular, engaging millions of participants who aim to build the best teams by carefully selecting NFL players. However, making informed decisions on which players to draft, start, or trade can be challenging due to numerous factors influencing a player's performance, such as previous stats, injuries, weather conditions, and team dynamics. This problem primarily affects fantasy football players, ranging from casual fans to serious league participants, who seek to optimize their rosters for success.

Affected Population
The primary audience impacted by this solution includes fantasy football players who need predictive insights to make strategic roster decisions. Secondary audiences could include sports analysts, fantasy league hosts, and sports betting platforms that benefit from accurate player performance forecasts.

Proposed Data Science Solution
This project proposes a data science solution utilizing machine learning techniques to predict NFL players' fantasy football statistics. By analyzing historical performance data and other contextual factors, the model will generate predictions to aid users in making better roster decisions. This solution leverages predictive modeling to uncover patterns and insights that are difficult for players to discern on their own.

Impact of the Solution
The implementation of this solution will enable fantasy football players to make more informed decisions, ultimately increasing their chances of success in fantasy leagues. Additionally, it could reduce the reliance on expert analyses, empowering users with data-driven insights directly. Beyond individual users, this model may also benefit fantasy sports platforms and betting services by enhancing user engagement and satisfaction.

Dataset Description
The dataset used in this project includes detailed NFL competition and fantasy football data sourced from Kaggle. It contains weekly player statistics, including performance metrics like touchdowns, yards gained, receptions, and points scored. Additionally, contextual variables such as player injuries, weather conditions, and team performance are included to increase the model's predictive accuracy.

### Demo

... Show your work:
...     Data visualizations
...     Interactive demo (e.g., `streamlit` app)
...     Short video of users trying out the solution


### Methodology

... High-level diagrams of entire process:
...     various data processing steps
...     various modelling directions
...     various prototyping directions


### Organization

#### Repository 

* `data` 
    - contains link to copy of the dataset (stored in a publicly accessible cloud storage)
    - saved copy of aggregated / processed data as long as those are not too large (> 10 MB)

* `model`
    - `joblib` dump of final model(s)

* `notebooks`
    - contains all final notebooks involved in the project

* `docs`
    - contains final report, presentations which summarize the project

* `references`
    - contains papers / tutorials used in the project

* `src`
    - Contains the project source code (refactored from the notebooks)

* `.gitignore`
    - Part of Git, includes files and folders to be ignored by Git version control

* `conda.yml`
    - Conda environment specification

* `README.md`
    - Project landing page (this page)

* `LICENSE`
    - Project license

#### Dataset

https://docs.google.com/spreadsheets/d/1G9FEd53wvaNwfyhXPGsbXaaN3Icwr4Fh/edit?usp=drive_link&ouid=100620050989856606753&rtpof=true&sd=true

### Credits & References

... Include any personal learning
