Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76328CAC5BB
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmo-0005uk-FE; Wed, 01 Oct 2025 04:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmm-0005ty-Ui
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmI-0006Ai-VU
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iXRxIvcEe/Z7qFtxTMRf88GtEhTdd8ApPecigj5FOVg=;
 b=T+rcyh/i7yuZ/ORvRoPl6FiSa1zfpKGs8w12v6KgkrKSVChgd//g2nvUcVrrA3IiwrOgZ/
 hLv966952FMuu/tuDFn4jxtk4vhCDHj0SqXPPBEiGBJ4wMEdT/+wNMX7ajkbNBRbxX3LZJ
 rLPSMSKxAHzQ3t+wAPPFAzImavZlaDI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-ZOIVchaYMUaWBnq9Tnt6aw-1; Wed, 01 Oct 2025 04:01:26 -0400
X-MC-Unique: ZOIVchaYMUaWBnq9Tnt6aw-1
X-Mimecast-MFC-AGG-ID: ZOIVchaYMUaWBnq9Tnt6aw_1759305686
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-b04a8ae1409so964411766b.2
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305685; x=1759910485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXRxIvcEe/Z7qFtxTMRf88GtEhTdd8ApPecigj5FOVg=;
 b=UnGO73VdNd7oBRd/hJtSutIEbvlNgzTz/Ho4riIM0ymvHDgEHFgvcuIufVxJF5P1fx
 /2pwTPUpAm16AeS6WWNWJaJ8kvne31ncQEgcMDB2DgkhTYCBNxd456l6rli086RQbFa6
 SHD3VjfhCHbqBY+E6w6Iz2JcgF4uwGK/NAdG6hJI2GD47pNweAqo+o7SQqMouYGGDbpq
 Iu5CV3aSgoEHmRGeBzQQ6GAyDPefbeMNggJk/zZKR8Upu4dy7HJktftMPcbKpN/h0d6n
 B6wyzh010kuw9gOBNJWQSEs4r0dewd0Aafy75Ccc9Pbf5gCa0BNjZvnxpQLfguyU1NUA
 /KmA==
X-Gm-Message-State: AOJu0Yyd19wXQzr4icZY88VcyW+PLCvfgewfg7K6B9e2QDMoSKQTAGfu
 BMsMb3O3honBTncP5ldXsyv0H67bIjADXQR5KzGpjv04YbUrbBqVq/rKifsnvqAlAHEAHlqHT3Y
 AohaqEOLgvpb2vejqcPwSWC7WQj2hIOzcFV3+gB3W58vLI6AuuSGW474=
X-Gm-Gg: ASbGnctrds7l3TULutH0WS8lq4eUZ+3f4G5/ltFDYoiZT1heTWzrXxemcrlwODawiEP
 L/RtSIghLQqyrBFtNbrn4IE/NekDRdVsqSAP9A6Jb3xIp5JTrZEh/uiyEYCfxftrFzqkO1Vjqbl
 jktg5OKdxu7lXnb3uhzrxKyubDVORMNKyNwIBnTyBol8bbb9VEnS4/reZNYCP7K2RAt7/TI4Okn
 HHSnPTYXYvuR2NXnezomtQvvFxIqe8QaSDJAVe9VaPlnmL1wfIrcmigqLz/atlAwGER5b6UeVmE
 /oBunT1niDq0kuDz9f6/uISQmKbREroTCOcfsopDp/8Ev40/erPWbTdRI7n3tgYRc1epYLHWI3n
 9NLPafXCzXRbiWTcOm+QKPJYcnXUqUb0SaT95DwQh654hYYcXuIk=
X-Received: by 2002:a17:906:5607:b0:b47:de64:df1e with SMTP id
 a640c23a62f3a-b47de64e377mr21304466b.4.1759305685410; 
 Wed, 01 Oct 2025 01:01:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECp6ucsvTf8qIxdz1Z0r5ke/rmhTYGrrISeMrRk+6Rs27KZyPF3EOVognMGBp2ohqYu/TyyA==
X-Received: by 2002:a17:906:5607:b0:b47:de64:df1e with SMTP id
 a640c23a62f3a-b47de64e377mr21300666b.4.1759305684996; 
 Wed, 01 Oct 2025 01:01:24 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f772528sm1316250066b.37.2025.10.01.01.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:01:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 13/14] rust/util: build QAPI types
Date: Wed,  1 Oct 2025 10:00:50 +0200
Message-ID: <20251001080051.1043944-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IBke81CZZ2VwloOATtR_4ZgsxYY4jj-RUmbIwheUFyw_1759305686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 rust/util/wrapper.h          |  1 +
 qapi/meson.build             |  6 ++++++
 rust/Cargo.lock              |  1 +
 rust/util/Cargo.toml         |  1 +
 rust/util/meson.build        | 18 +++++++++++++++++-
 rust/util/src/qobject/mod.rs |  9 +++++++++
 6 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/rust/util/wrapper.h b/rust/util/wrapper.h
index 0907dd59142..c88820a5e5b 100644
--- a/rust/util/wrapper.h
+++ b/rust/util/wrapper.h
@@ -37,3 +37,4 @@ typedef enum memory_order {
 #include "qobject/qobject.h"
 #include "qobject/qlist.h"
 #include "qobject/qdict.h"
+#include "qobject/qjson.h"
diff --git a/qapi/meson.build b/qapi/meson.build
index ca6b61a608d..5d4b55b47f8 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -129,3 +129,9 @@ foreach output : qapi_outputs
   util_ss.add(qapi_files[i])
   i = i + 1
 endforeach
+
+qapi_rs_files = custom_target('QAPI Rust',
+  output: 'qapi-types.rs',
+  input: [ files('qapi-schema.json') ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '-B', 'qapi.backend.QAPIRsBackend' ],
+  depend_files: [ qapi_inputs, qapi_gen_depends ])
diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index c1075e11d6c..991533d92c1 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -447,6 +447,7 @@ dependencies = [
  "glib-sys",
  "libc",
  "serde",
+ "serde_derive",
 ]
 
 [[package]]
diff --git a/rust/util/Cargo.toml b/rust/util/Cargo.toml
index 554004816eb..9f6c52c5acd 100644
--- a/rust/util/Cargo.toml
+++ b/rust/util/Cargo.toml
@@ -18,6 +18,7 @@ foreign = { workspace = true }
 glib-sys = { workspace = true }
 libc = { workspace = true }
 serde = { workspace = true }
+serde_derive = { workspace = true }
 common = { path = "../common" }
 
 [lints]
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 45366d03786..a2d0e6ded0d 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -50,7 +50,7 @@ _util_rs = static_library(
   dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, serde_rs, qom, qemuutil],
 )
 
-util_rs = declare_dependency(link_with: [_util_rs], dependencies: [qemuutil, qom])
+util_rs = declare_dependency(link_with: [_util_rs], dependencies: [])
 
 rust.test('rust-util-tests', _util_rs,
           dependencies: [qemuutil, qom],
@@ -64,3 +64,19 @@ rust.doctest('rust-util-rs-doctests',
      dependencies: util_rs,
      suite: ['doc', 'rust']
 )
+
+_qapi_cfg = run_command(rustc_args,
+  '--no-strict-cfg',
+  '--config-headers', config_host_h,
+  capture: true, check: true).stdout().strip().splitlines()
+
+_qapi_rs = static_library(
+  'qapi',
+  qapi_rs_files,
+  rust_args: _qapi_cfg,
+  override_options: ['rust_std=2021', 'build.rust_std=2021'],
+  rust_abi: 'rust',
+  dependencies: [common_rs, util_rs, serde_rs],
+)
+
+qapi_rs = declare_dependency(link_with: [_qapi_rs])
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
index b6e86f11a64..f2618c86473 100644
--- a/rust/util/src/qobject/mod.rs
+++ b/rust/util/src/qobject/mod.rs
@@ -13,6 +13,7 @@
 mod serializer;
 
 use core::fmt::{self, Debug, Display};
+use foreign::prelude::*;
 use std::{
     cell::UnsafeCell,
     ffi::{c_char, CString},
@@ -104,6 +105,14 @@ fn refcnt(&self) -> &AtomicUsize {
         let qobj = self.0.get();
         unsafe { AtomicUsize::from_ptr(addr_of_mut!((*qobj).base.refcnt)) }
     }
+
+    pub fn to_json(&self) -> String {
+        let qobj = self.0.get();
+        unsafe {
+            let json = bindings::qobject_to_json(qobj);
+            glib_sys::g_string_free(json, glib_sys::GFALSE).into_native()
+        }
+    }
 }
 
 impl From<()> for QObject {
-- 
2.51.0


