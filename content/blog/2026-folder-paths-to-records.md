---
title: "One File, Many Folders: Turning Folder Paths Into One Clean Record"
slug: "2026-folder-paths-to-records"
order: 0
section: "blog"
template: post
status: published
nav: hidden
date: "2026-11-12"
excerpt: "When the same file is saved in several folders, copies multiply and search gets worse. Here is how reading the folder path itself can turn many copies into one well-described record."
categories:
  - "DAM"
  - "Integrations"
  - "Orange Logic"
coverImage: "/images/blog-posts/2026-folder-paths-to-records.webp"
---

Most teams have the same problem, whatever they store their files in. A file is saved under one name, then saved again in another folder, and again in a third. Each copy becomes its own record. Search returns three results that look the same, nobody is sure which one is current, and the folders that were meant to organize everything end up hiding it.

This is a pattern from a recent project, described with the client's confidentiality intact.

## The folder path already knows a lot

People often put meaning into folder names. A path like `Region / Project / Stage / plan.pdf` can say where the work belongs, which project it is part of, and how far along it is, before anyone opens the file. (The folder names here are made up for illustration.)

The project worked with [File On Demand](https://www.orangelogic.com/products/digital-asset-management-integrations), which Orange Logic describes as streaming files from its digital asset management system (the DAM) without full downloads or duplicate copies. It presents virtual folder paths, and those paths are there to be read.

## What was built

Matthew Roe, the owner-operator, built metadata extraction and record consolidation on top of those virtual folder paths:

- **Read the path.** Each part of the path and the file name is turned into structured information on the record, so `Region`, `Project` and `Stage` become real fields people can filter and search on.
- **One file, one record.** When the same file name turns up in several locations, its versions and its metadata are brought together into a single record, instead of one record per copy.

## The result

There are fewer duplicate records than with traditional file storage such as SharePoint or Google Drive, and search gets better, because each result is one record with everything known about it.

## Versions and links

Two things follow from having one record per file:

- **One history.** Every version of a file sits in a single history on its record, not scattered across copies in different folders.
- **Related records are linked.** Records that share extracted information, such as the same project, are connected, so related files can be found from one another.

If your files live in many places at once, [let's talk](/contact/).

*Cover image generated locally with an open image model (Z-Image-Turbo, Apache-2.0).*
