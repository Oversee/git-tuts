DS Github Flow
==============
---

For Dev
-------
1. Master is *always* releasable.
2. A named branch per user story and defect (post release)
3. Create 'Pull Request' at ease.
  - QA can start at this point
4. Push to named branch very often
  - Consider pulling from master as sprint moves on to help resolve merge conflicts early

For QA
------
- At Dev#2 QA can start
- Sign off on each story (in the github 'Pull Request')
- Once all stories are pass okay for build

For Build
---------
- 'tag' a release off of master at commit QA signs off on
