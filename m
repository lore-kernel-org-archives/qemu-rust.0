Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE9ED185EF
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:12:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpnh-0008GC-6V; Thu, 08 Jan 2026 08:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpne-0008Cv-OQ
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpnc-00085R-CL
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pl9MaI8akrkrPlYIE8JGPWnSFtcqCQUxWaCZczxL/vQ=;
 b=X1rmS78s34JYvv+ruVjEQCoKe+/1jLsqnUOVTup0J1L7T+HgUg3kT3m7KG8HyUYKVraqEp
 rXpfEkxy5BXbmS30cWUZKXb+95YE7ccX3McodQKzfEYRWI5Pj6ftXvXN8rDEWIWJiblMyP
 NCnTwGym8q00NYGw9LVMfFncHnn+mRU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-pq7dm2B2MsKpxCcsmd9jRg-1; Thu, 08 Jan 2026 08:11:34 -0500
X-MC-Unique: pq7dm2B2MsKpxCcsmd9jRg-1
X-Mimecast-MFC-AGG-ID: pq7dm2B2MsKpxCcsmd9jRg_1767877891
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4779edba8f3so27563885e9.3
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877891; x=1768482691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pl9MaI8akrkrPlYIE8JGPWnSFtcqCQUxWaCZczxL/vQ=;
 b=qUZ279ueI/zxM6PToqSbedESFSTwZQaJWQNA8GK1oR7TeT3rOqouF3FVJiBcL6V44p
 Beo0FUrzLR1I+h0zO1v7DNqozaPHZGZ4ivcrAAb3Y0RvFk5HCP28SWD2GOpcd0OlumYQ
 j73tX78MGiV5jPBjIxFBqxcjbCuJEAG+0joxAqaHISDXKMvG9+JUxB3pNHYfghi1cgZh
 5PcGq4xa4XTKIQfUsYWaUo96OIu8piLHLN7soQKMDaTWHbiTfWlq0VYAfhSuivQWxFXB
 usAIgZbYZBwOYqUJH+krUoM0G1Z7nt65dYk3hNs+hV0/rGWDN1HpkG36EjsijspcnGXY
 gieA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8A7cMcFmV9/5mpGvZfIKS4V9Py37kz95CEO3W+yAWh/AbfkttA/Fr2WhlSmu9oPHqioFYV8apXys=@nongnu.org
X-Gm-Message-State: AOJu0Yw3pZiMvPACtnqzS9tcJg1hDGfxxijxdWVZ08CsVOuUTTIiuRbQ
 2sc38u4hnW8xjXpqso33CLX88O/B3c1jwVn/Dmwrjto6jznlmXeLDMmLCwAQ62fJGrxbty/R0BF
 xuYyNQhAxCV9ZFz3oTbasAn686/tsFzZ27Gh2qhBSF1ElbhZe0O0kZzI=
X-Gm-Gg: AY/fxX4QOe0rN3A0av7vdnyPyOezPB8KpJBNo79F5xTte1PtUb1nDRFJFwZgLw4nmVD
 PZX6oz9A+nsnQR+2E1Gd9AKGOmQlPWDP3Z17jyFEhpLlO4BqngJMWxm9ovf6PwEm8sh6IXiGpN5
 OyCKt3hngpG26eHwnsgfG0P02kxUM5u49YDXSQwshjNV0yhDOStjCtS7LYYstqW+L96S8D/aQay
 mRHVXn2p9sB71TFd3ESkBayl8BeWUmLTecIKlD5dA5UogxLvuxvN0QVkR8A5jlkLiBKDEWL6RSp
 W5IpqpDUPaogyKhFtggZhrBlXwCDZfOLXqddgD3zvYo/x/TKQv+zVo+barh3JiPlXeJGiOWzgj7
 KFtTPxxdQN+PTM1OpC4iTYq32+OnAMycFT0ja9tjYzIYy2avQCC+KWOTv8GJrOPlM8o2/AsUI0W
 uzVCQUnrDe9sUWsg==
X-Received: by 2002:a05:600c:82c3:b0:477:9392:8557 with SMTP id
 5b1f17b1804b1-47d84b3463fmr67039855e9.18.1767877891185; 
 Thu, 08 Jan 2026 05:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7jTJIl7PPoheEFtg3b1V3QiQigsyWyeXNqsvJj4L6m2tw3NnRWiGyNREBEWux8acQiI7JbA==
X-Received: by 2002:a05:600c:82c3:b0:477:9392:8557 with SMTP id
 5b1f17b1804b1-47d84b3463fmr67039595e9.18.1767877890628; 
 Thu, 08 Jan 2026 05:11:30 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f418538sm150823175e9.5.2026.01.08.05.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:11:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org
Subject: [PATCH v2 16/16] rust/tests: QAPI integration tests
Date: Thu,  8 Jan 2026 14:10:43 +0100
Message-ID: <20260108131043.490084-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nATK3miaPPFv88j-2iqY-Q1MhRONIJrS5YNJRentfak_1767877891
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/tests/meson.build          |  21 +-
 rust/tests/tests/integration.rs |   2 +
 rust/tests/tests/qapi.rs        | 444 ++++++++++++++++++++++++++++++++
 3 files changed, 464 insertions(+), 3 deletions(-)
 create mode 100644 rust/tests/tests/integration.rs
 create mode 100644 rust/tests/tests/qapi.rs

diff --git a/rust/tests/meson.build b/rust/tests/meson.build
index 3c5020490b0..d781b52bd78 100644
--- a/rust/tests/meson.build
+++ b/rust/tests/meson.build
@@ -1,10 +1,25 @@
+test_qapi_rs_files = custom_target('QAPI Rust',
+  output: 'test-qapi-types.rs',
+  input: [ files(meson.project_source_root() + '/tests/qapi-schema/qapi-schema-test.json') ],
+  command: [ qapi_gen, '-o', meson.current_build_dir(), '-b', '@INPUT0@', '-B', 'qapi.backend.QAPIRsBackend', '-p', 'test-' ],
+  depend_files: [ qapi_inputs, qapi_gen_depends ])
+
+_test_qapi_rs = static_library(
+    'test_qapi',
+    test_qapi_rs_files,
+    override_options: ['rust_std=2021', 'build.rust_std=2021'],
+    rust_abi: 'rust',
+    dependencies: [common_rs, util_rs, serde_rs, serde_derive_rs])
+
+test_qapi_rs = declare_dependency(link_with: [_test_qapi_rs])
+
 test('rust-integration',
     executable(
         'rust-integration',
-        files('tests/vmstate_tests.rs'),
-        rust_args: ['--test'],
+        files('tests/integration.rs'),
+        rust_args: ['--test'] + _qapi_cfg,
         install: false,
-        dependencies: [bql_rs, common_rs, util_rs, migration_rs, qom_rs]),
+        dependencies: [bql_rs, common_rs, util_rs, migration_rs, qom_rs, qapi_rs, test_qapi_rs]),
     args: [
         '--test', '--test-threads', '1',
         '--format', 'pretty',
diff --git a/rust/tests/tests/integration.rs b/rust/tests/tests/integration.rs
new file mode 100644
index 00000000000..ebc17cb5550
--- /dev/null
+++ b/rust/tests/tests/integration.rs
@@ -0,0 +1,2 @@
+mod qapi;
+mod vmstate_tests;
diff --git a/rust/tests/tests/qapi.rs b/rust/tests/tests/qapi.rs
new file mode 100644
index 00000000000..f8a585e5802
--- /dev/null
+++ b/rust/tests/tests/qapi.rs
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#![allow(unexpected_cfgs)]
+#![allow(clippy::shadow_unrelated)]
+
+use util::qobject::{from_qobject, to_qobject, QObject};
+
+#[test]
+fn test_char() {
+    let json = "\"v\"";
+    let qo = QObject::from_json(json).unwrap();
+    let c: char = from_qobject(qo).unwrap();
+    assert_eq!(c, 'v');
+    assert_eq!(to_qobject(c).unwrap().to_json(), json);
+
+    let json = "'va'";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<char>(qo).unwrap_err();
+}
+
+#[test]
+fn test_enum() {
+    let json = "\"value1\"";
+    let qo = QObject::from_json(json).unwrap();
+    let e: test_qapi::EnumOne = from_qobject(qo).unwrap();
+    assert_eq!(e, test_qapi::EnumOne::VALUE1);
+    assert_eq!(to_qobject(e).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_struct() {
+    let expected = test_qapi::TestStruct {
+        integer: -42,
+        boolean: true,
+        string: "foo".into(),
+    };
+    let json = "{\"integer\": -42, \"boolean\": true, \"string\": \"foo\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let ts: test_qapi::TestStruct = from_qobject(qo).unwrap();
+    assert_eq!(ts, expected);
+    assert_eq!(to_qobject(ts).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_struct_nested() {
+    let expected = test_qapi::UserDefTwo {
+        string0: "string0".into(),
+        dict1: test_qapi::UserDefTwoDict {
+            string1: "string1".into(),
+            dict2: test_qapi::UserDefTwoDictDict {
+                userdef: test_qapi::UserDefOne {
+                    integer: 42,
+                    string: "string".into(),
+                    enum1: None,
+                },
+                string: "string2".into(),
+            },
+            dict3: None,
+        },
+    };
+    let json = "{\"string0\": \"string0\", \"dict1\": {\"dict2\": {\"string\": \"string2\", \
+                \"userdef\": {\"integer\": 42, \"string\": \"string\"}}, \"string1\": \
+                \"string1\"}}";
+    let qo = QObject::from_json(json).unwrap();
+    let udt: test_qapi::UserDefTwo = from_qobject(qo).unwrap();
+    assert_eq!(udt, expected);
+    assert_eq!(to_qobject(udt).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_list() {
+    let expected = [
+        test_qapi::UserDefOne {
+            integer: 42,
+            string: "string0".into(),
+            enum1: None,
+        },
+        test_qapi::UserDefOne {
+            integer: 43,
+            string: "string1".into(),
+            enum1: None,
+        },
+        test_qapi::UserDefOne {
+            integer: 44,
+            string: "string2".into(),
+            enum1: None,
+        },
+    ];
+    let json = "[{\"integer\": 42, \"string\": \"string0\"}, {\"integer\": 43, \"string\": \
+                \"string1\"}, {\"integer\": 44, \"string\": \"string2\"}]";
+    let qo = QObject::from_json(json).unwrap();
+    let ud_list: Vec<test_qapi::UserDefOne> = from_qobject(qo).unwrap();
+    assert_eq!(ud_list, expected);
+    assert_eq!(to_qobject(ud_list).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_flat_union() {
+    let expected = test_qapi::UserDefFlatUnion {
+        integer: 41,
+        string: "str".into(),
+        u: test_qapi::UserDefFlatUnionVariant::Value1(test_qapi::UserDefA {
+            boolean: true,
+            a_b: None,
+        }),
+    };
+    let json = "{\"integer\": 41, \"boolean\": true, \"enum1\": \"value1\", \"string\": \"str\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let ud_fu: test_qapi::UserDefFlatUnion = from_qobject(qo).unwrap();
+    assert_eq!(ud_fu, expected);
+    assert_eq!(to_qobject(ud_fu).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_union_in_union() {
+    let expected = test_qapi::TestUnionInUnion {
+        u: test_qapi::TestUnionInUnionVariant::ValueA(test_qapi::TestUnionTypeA {
+            u: test_qapi::TestUnionTypeAVariant::ValueA1(test_qapi::TestUnionTypeA1 {
+                integer: 2,
+                name: "fish".into(),
+            }),
+        }),
+    };
+    let json =
+        "{\"name\": \"fish\", \"integer\": 2, \"type-a\": \"value-a1\", \"type\": \"value-a\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let uu: test_qapi::TestUnionInUnion = from_qobject(qo).unwrap();
+    assert_eq!(uu, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::TestUnionInUnion {
+        u: test_qapi::TestUnionInUnionVariant::ValueA(test_qapi::TestUnionTypeA {
+            u: test_qapi::TestUnionTypeAVariant::ValueA2(test_qapi::TestUnionTypeA2 {
+                integer: 1729,
+                size: 87539319,
+            }),
+        }),
+    };
+    let json =
+        "{\"integer\": 1729, \"type-a\": \"value-a2\", \"size\": 87539319, \"type\": \"value-a\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let uu: test_qapi::TestUnionInUnion = from_qobject(qo).unwrap();
+    assert_eq!(uu, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::TestUnionInUnion {
+        u: test_qapi::TestUnionInUnionVariant::ValueB(test_qapi::TestUnionTypeB {
+            integer: 1729,
+            onoff: true,
+        }),
+    };
+    let json = "{\"integer\": 1729, \"onoff\": true, \"type\": \"value-b\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let uu: test_qapi::TestUnionInUnion = from_qobject(qo).unwrap();
+    assert_eq!(uu, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_alternate() {
+    let expected = test_qapi::UserDefAlternate::I(42);
+    let json = "42";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::UserDefAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::UserDefAlternate::E(test_qapi::EnumOne::VALUE1);
+    let json = "\"value1\"";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::UserDefAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::UserDefAlternate::N(());
+    let json = "null";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::UserDefAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::UserDefAlternate::Udfu(test_qapi::UserDefFlatUnion {
+        integer: 42,
+        string: "str".to_string(),
+        u: test_qapi::UserDefFlatUnionVariant::Value1(test_qapi::UserDefA {
+            boolean: true,
+            a_b: None,
+        }),
+    });
+    let json = "{\"integer\": 42, \"boolean\": true, \"enum1\": \"value1\", \"string\": \"str\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::UserDefAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::WrapAlternate {
+        alt: test_qapi::UserDefAlternate::I(42),
+    };
+    let json = "{\"alt\": 42}";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::WrapAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::WrapAlternate {
+        alt: test_qapi::UserDefAlternate::E(test_qapi::EnumOne::VALUE1),
+    };
+    let json = "{\"alt\": \"value1\"}";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::WrapAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::WrapAlternate {
+        alt: test_qapi::UserDefAlternate::Udfu(test_qapi::UserDefFlatUnion {
+            integer: 1,
+            string: "str".to_string(),
+            u: test_qapi::UserDefFlatUnionVariant::Value1(test_qapi::UserDefA {
+                boolean: true,
+                a_b: None,
+            }),
+        }),
+    };
+    let json = "{\"alt\": {\"integer\": 1, \"boolean\": true, \"enum1\": \"value1\", \"string\": \
+                \"str\"}}";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::WrapAlternate = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_alternate_number() {
+    let expected = test_qapi::AltEnumNum::N(42.0);
+    let json = "42";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltEnumNum = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::AltNumEnum::N(42.0);
+    let json = "42";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltNumEnum = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::AltEnumInt::I(42);
+    let json = "42";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltEnumInt = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::AltListInt::I(42);
+    let json = "42";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltListInt = from_qobject(qo).unwrap();
+    assert_eq!(&uda, &expected);
+    assert_eq!(to_qobject(&expected).unwrap().to_json(), json);
+
+    // double
+    let json = "42.5";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::AltEnumBool>(qo).unwrap_err();
+
+    let expected = test_qapi::AltEnumNum::N(42.5);
+    let json = "42.5";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltEnumNum = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let expected = test_qapi::AltNumEnum::N(42.5);
+    let json = "42.5";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltNumEnum = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+
+    let json = "42.5";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::AltEnumInt>(qo).unwrap_err();
+}
+
+#[test]
+fn test_alternate_list() {
+    let expected = test_qapi::AltListInt::L(vec![42, 43, 44]);
+    let json = "[42, 43, 44]";
+    let qo = QObject::from_json(json).unwrap();
+    let uda: test_qapi::AltListInt = from_qobject(qo).unwrap();
+    assert_eq!(uda, expected);
+    assert_eq!(to_qobject(expected).unwrap().to_json(), json);
+}
+
+#[test]
+fn test_errors() {
+    let json = "{ 'integer': false, 'boolean': 'foo', 'string': -42 }";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::TestStruct>(qo).unwrap_err();
+
+    let json = "[ '1', '2', false, '3' ]";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<String>>(qo).unwrap_err();
+
+    let json = "{ 'str': 'hi' }";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::UserDefTwo>(qo).unwrap_err();
+
+    let json = "{}";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::WrapAlternate>(qo).unwrap_err();
+}
+
+#[test]
+fn test_wrong_type() {
+    let json = "[]";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::TestStruct>(qo).unwrap_err();
+
+    let json = "{}";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<String>>(qo).unwrap_err();
+
+    let json = "1";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::TestStruct>(qo).unwrap_err();
+
+    let json = "{}";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<i64>(qo).unwrap_err();
+
+    let json = "1";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<String>>(qo).unwrap_err();
+
+    let json = "[]";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<i64>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_struct() {
+    let json = "{ 'integer': -42, 'boolean': true, 'string': 'foo', 'extra': 42 }";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::TestStruct>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_struct_nested() {
+    let json = "{ 'string0': 'string0', 'dict1': { 'string1': 'string1', 'dict2': { 'userdef1': { \
+                'integer': 42, 'string': 'string', 'extra': [42, 23, {'foo':'bar'}] }, 'string2': \
+                'string2'}}}";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<test_qapi::UserDefTwo>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_struct_in_list() {
+    let json = "[ { 'string': 'string0', 'integer': 42 }, { 'string': 'string1', 'integer': 43 }, \
+                { 'string': 'string2', 'integer': 44, 'extra': 'ggg' } ]";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<test_qapi::UserDefOne>>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_union_flat() {
+    let json = "{ 'enum1': 'value2', 'string': 'c', 'integer': 41, 'boolean': true }";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<test_qapi::UserDefFlatUnion>>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_union_flat_no_discrim() {
+    // test situation where discriminator field ('enum1' here) is missing
+    let json = "{ 'integer': 42, 'string': 'c', 'string1': 'd', 'string2': 'e' }";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<test_qapi::UserDefFlatUnion2>>(qo).unwrap_err();
+}
+
+#[test]
+fn test_fail_alternate() {
+    let json = "3.14";
+    let qo = QObject::from_json(json).unwrap();
+    from_qobject::<Vec<test_qapi::UserDefAlternate>>(qo).unwrap_err();
+}
+
+#[test]
+fn test_qapi() {
+    let expected = qapi::InetSocketAddress {
+        host: "host-val".to_string(),
+        port: "port-val".to_string(),
+        numeric: None,
+        to: None,
+        ipv4: None,
+        ipv6: None,
+        keep_alive: None,
+        #[cfg(HAVE_TCP_KEEPCNT)]
+        keep_alive_count: None,
+        #[cfg(HAVE_TCP_KEEPIDLE)]
+        keep_alive_idle: Some(42),
+        #[cfg(HAVE_TCP_KEEPINTVL)]
+        keep_alive_interval: None,
+        #[cfg(HAVE_IPPROTO_MPTCP)]
+        mptcp: None,
+    };
+
+    let qsa = to_qobject(&expected).unwrap();
+    let json = qsa.to_json();
+    assert_eq!(
+        json,
+        "{\"port\": \"port-val\", \"keep_alive_idle\": 42, \"host\": \"host-val\"}"
+    );
+    let sa: qapi::InetSocketAddress = from_qobject(qsa).unwrap();
+    assert_eq!(sa, expected);
+
+    let expected = qapi::SocketAddressVariant::Inet(expected);
+    let qsav = to_qobject(&expected).unwrap();
+    let json = qsav.to_json();
+    assert_eq!(
+        json,
+        "{\"port\": \"port-val\", \"keep_alive_idle\": 42, \"host\": \"host-val\", \"type\": \
+         \"inet\"}"
+    );
+    let sav: qapi::SocketAddressVariant = from_qobject(qsav).unwrap();
+    assert_eq!(sav, expected);
+
+    let expected = qapi::Qcow2BitmapInfo {
+        name: "name-val".to_string(),
+        granularity: 4096,
+        flags: vec![
+            qapi::Qcow2BitmapInfoFlags::IN_USE,
+            qapi::Qcow2BitmapInfoFlags::AUTO,
+        ],
+    };
+    let qbi = to_qobject(&expected).unwrap();
+    let json = qbi.to_json();
+    assert_eq!(
+        json,
+        "{\"flags\": [\"in-use\", \"auto\"], \"name\": \"name-val\", \"granularity\": 4096}"
+    );
+    let bi: qapi::Qcow2BitmapInfo = from_qobject(qbi).unwrap();
+    assert_eq!(bi, expected);
+}
-- 
2.52.0


