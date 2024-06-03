import type { UserConfig } from '@commitlint/types'
import nxScopes from '@commitlint/config-nx-scopes'

const {
  default: {
    utils: {getProjects},
  },
} = nxScopes;

const commonScopes = ['infra']

export default {
  extends: ['@commitlint/config-conventional', '@commitlint/config-nx-scopes'],
  rules: {
    // 'subject-empty': [0],
    'scope-enum': async () => [
      2,
      'always',
      // See https://github.com/conventional-changelog/commitlint/blob/bc4d797dea7aba1af1076a1854d67f038e150200/%40commitlint/config-nx-scopes/index.js#L27
      [
        // Adds common scopes and NX projects dynamically
        ...commonScopes,
        ...(await getProjects(
          {},
          ({tags}) => {
            return !tags.includes('stage:end-of-life')
          }
        )),
      ],
    ],
    'type-enum': [
      2,
      'always',
      [
        'build',
        'chore',
        'ci',
        'docs',
        'feat',
        'fix',
        'perf',
        'refactor',
        'revert',
        'style',
        'test',
        'BREAKING CHANGE',
      ],
    ],
  },
  // parserPreset: {
  //   parserOpts: {
  //     headerPattern: /^\w*\s\((\w*)\) \[\w*\]\s(.*)$/,
  //     headerCorrespondence: ['type', 'scope', 'ticket', 'subject'],
  //     issuePrefixes: ['UI-', 'HTT-'],
  //   },
  // },
} satisfies UserConfig;
