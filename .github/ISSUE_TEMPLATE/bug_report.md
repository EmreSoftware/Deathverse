name: Bug Report
description: Report a reproducible issue in Deathverse.
title: "[BUG] Short title"
labels: ["bug"]
assignees: ["EmreSoftware"]

body:
  - type: markdown
    attributes:
      value: |
        ## Describe the bug
        A short, clear description of the issue.  
        Example: "Kill message prints twice" or "Killstreak counter resets randomly."

  - type: textarea
    id: repro
    attributes:
      label: Steps to reproduce
      description: "Explain how to trigger the issue. If unsure, describe when it usually happens."
      placeholder: |
        1.
        2.
        3.
    validations:
      required: true

  - type: textarea
    id: expected
    attributes:
      label: Expected behavior
      description: "What should happen?"
    validations:
      required: true

  - type: textarea
    id: current
    attributes:
      label: Current behavior
      description: "What actually happens?"
    validations:
      required: true

  - type: textarea
    id: logs
    attributes:
      label: Logs / errors
      description: "Paste relevant server or client logs here (no screenshots). Include Lua errors if visible."
      render: text

  - type: input
    id: gmod_branch
    attributes:
      label: Garry's Mod branch
      placeholder: "Stable / x86-64 / Dev"

  - type: input
    id: gamemode
    attributes:
      label: Gamemode

  - type: input
    id: map
    attributes:
      label: Map

  - type: input
    id: servertype
    attributes:
      label: Server type
      placeholder: "Dedicated / Local / Windows / Linux"

  - type: input
    id: version
    attributes:
      label: Deathverse version
      placeholder: "Version tag"

  - type: textarea
    id: addons
    attributes:
      label: Other addons installed
      description: "List only addons that might affect kill messages, combat, HUD, or sound hooks."

  - type: checkboxes
    id: confirm
    attributes:
      label: Before submitting
      options:
        - label: I checked and this bug is not already reported.
          required: true
        - label: I can reproduce this issue using the official, unmodified version of Deathverse.
          required: true
