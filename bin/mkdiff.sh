#!/bin/bash

HASH=$1
OUT_DIR=~/dev/diff/${HASH}
BEFORE_DIR=${OUT_DIR}/00_before/
AFTER_DIR=${OUT_DIR}/10_after/
TOPIC_BR=`git br | awk -F ' ' '/^*/ {print $2}'`

#差分ディレクトリ作成
mkdir -p ${BEFORE_DIR}
mkdir -p ${AFTER_DIR}

#差分ファイル取得
DIFF_FILES=()
DIFF_FILES=`git diff --name-status ${HASH}^ ${HASH} | awk -F '\t' '{print $2}'`

#afterファイル格納
git checkout ${HASH} >/dev/null 2>&1
for file in ${DIFF_FILES[@]}
do
	PARENT_DIR=`dirname ${file}`
	mkdir -p ${AFTER_DIR}${PARENT_DIR}
	cp -p ${file} ${AFTER_DIR}${PARENT_DIR}
done

#beforeファイル格納
git checkout ${HASH}^ >/dev/null 2>&1
for file in ${DIFF_FILES[@]}
do
	PARENT_DIR=`dirname ${file}`
	mkdir -p ${BEFORE_DIR}${PARENT_DIR}
        cp -p ${file} ${BEFORE_DIR}${PARENT_DIR}
done

#トピックブランチに戻す
git co ${TOPIC_BR} >/dev/null 2>&1

exit 0

