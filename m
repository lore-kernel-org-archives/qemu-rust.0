Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1D7CAC5B9
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:52:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9f-0001Sj-BH; Mon, 29 Sep 2025 11:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G9K-000175-C2
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8w-0000dh-Dd
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GX+XQG34QhW2M9FAgGQpzvALM9UdWisnSbHk4sV3OZ4=;
 b=Gyhe0+LOoX6DtutbC9TJamlA7Tj+rM3+4q22Pq06YYEETmWpLrwZY1J4QH0jjQDAjYAfzY
 nG0FkxEnfG9AtXz51jAtCag8m1GbdYUDb+a4ZUhvRKlpGv7OIPuWz4/lhiycgP/nWYplrl
 qrlN8ckUs2MQPvj8K1RoSFtrwGmcMAs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-1QGdP1IkMAu3lzcvctvMVw-1; Mon, 29 Sep 2025 11:50:23 -0400
X-MC-Unique: 1QGdP1IkMAu3lzcvctvMVw-1
X-Mimecast-MFC-AGG-ID: 1QGdP1IkMAu3lzcvctvMVw_1759161022
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-634b75ac0efso2485606a12.3
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161022; x=1759765822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GX+XQG34QhW2M9FAgGQpzvALM9UdWisnSbHk4sV3OZ4=;
 b=Miq2b64YxZF4ORyjRjqrcm9HaFzl086mbV46seqcyPPDQYp/f2cNrYDuIN4EjO9gdh
 SanKG5kY/lQT28RNfqaiE933KxShVTuCLZfvqa1sw09/wLDD5ydgLxDr/uDPMnRyDp2e
 /psaBBcPURWMlBXq5dU26zZFjy7b7jnJltSgB6tpsLF3z5xnoLCbDspp/yUcw0pepAck
 awEGhnF5fMHT+aDF8y4ZH4/mE1hGaLhlf2r0hxVQj5LrWjelWwGgYwrQSLd9UCRLtXo4
 cx200RINREmQ/O82OCIQGDfF1skWP6a6FB9TEByXF1PIFzf9GoyfHqiNsLGI3hQusFMB
 CtTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZGVRzh6kYRG0KBK755qrDtnIn+qMNAVeRnFt6hDW6wTJ52TF5VbfrJoSZnYO/z3FqqmCqwt8Lp0k=@nongnu.org
X-Gm-Message-State: AOJu0Yy4MxDgqu6sCS0lprRDvwnHo/um1Vmx8k6iXEm/voVaiT+XrUFH
 Hy1G5n2MUYWZpZ/rplxNugJv7ARRfbZJE/K91j8SPOSzLxZoW4MLf34AzehfDrKjCvSit2AxOZi
 hoGqy6L9ePGmC5wSBgvuO3p6Z4ObHdK1+zha4u/ic4J1BNAoZNn5w9oI=
X-Gm-Gg: ASbGnct5ukZOEnEZ/g2GwEH755p548XBPUcseU/A1U8NJYLRnorz9O4DTuKw1+a+1ei
 bfe0QK0FkrNBhMYygNwK/yM0fhVSz3Jo+KSNW6h4ydWNve7ivESy3U3mKcQqZTHgi9Zv96PfkHa
 zAP0jLfJVg7N98ev3ydWhwnABg7mHSp8TpzV5M1J9lxrJa1aVFbmqjsIOU+49AbNkWEPTOFsgUf
 i9Ds9knezS0MQymQscA3YmHCL9X4BZRdhiWLBiXXdS9ZXsuG1Y3XqWLDOxACXXkkJdtO3unSXS3
 WYoRlfxzXbmwiVSbUratz0QeQvBYW9pyjNd4P13eaTtSDs4zES09wQI0hTGVABtFQ4GZmaFofkL
 ivj5a5gCeZZ6YwGEMxSK7qRqrY2TYrC1LJPyV2I/eOkrgbg==
X-Received: by 2002:a05:6402:42ca:b0:634:b3d1:8f92 with SMTP id
 4fb4d7f45d1cf-634b3d19125mr13731496a12.0.1759161021654; 
 Mon, 29 Sep 2025 08:50:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHil11YGZNHe1Fxy80YdYgyHyNUXK7wTZ4TppgrKlVqH8WKnrUnKiuWjhaadDHCTs6Ay2F8kg==
X-Received: by 2002:a05:6402:42ca:b0:634:b3d1:8f92 with SMTP id
 4fb4d7f45d1cf-634b3d19125mr13731483a12.0.1759161021251; 
 Mon, 29 Sep 2025 08:50:21 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a362986dsm7912106a12.1.2025.09.29.08.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 16/16] tracetool/syslog: add Rust support
Date: Mon, 29 Sep 2025 17:49:38 +0200
Message-ID: <20250929154938.594389-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5o9Ti3il90olNbLvnFVqBxisNmoBxEwyiiOlDfEp9Ic_1759161022
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.513,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Tanish Desai <tanishdesai37@gmail.com>

The syslog backend needs the syslog function from libc and the LOG_INFO enum
value; they are re-exported as "::trace::syslog" and "::trace::LOG_INFO"
so that device crates do not all have to add the libc dependency, but
otherwise there is nothing special.

Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/Cargo.lock                     |  3 +++
 rust/trace/Cargo.toml               |  3 +++
 rust/trace/src/lib.rs               |  4 +++
 scripts/tracetool/backend/syslog.py |  7 ++++-
 tests/tracetool/syslog.rs           | 40 +++++++++++++++++++++++++++++
 tests/tracetool/tracetool-test.py   |  2 +-
 6 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 tests/tracetool/syslog.rs

diff --git a/rust/Cargo.lock b/rust/Cargo.lock
index f84a3dd0764..444ef516a70 100644
--- a/rust/Cargo.lock
+++ b/rust/Cargo.lock
@@ -262,6 +262,9 @@ dependencies = [
 [[package]]
 name = "trace"
 version = "0.1.0"
+dependencies = [
+ "libc",
+]
 
 [[package]]
 name = "unicode-ident"
diff --git a/rust/trace/Cargo.toml b/rust/trace/Cargo.toml
index 13ac0b33d6f..fc81bce5803 100644
--- a/rust/trace/Cargo.toml
+++ b/rust/trace/Cargo.toml
@@ -12,5 +12,8 @@ license.workspace = true
 repository.workspace = true
 rust-version.workspace = true
 
+[dependencies]
+libc = { workspace = true }
+
 [lints]
 workspace = true
diff --git a/rust/trace/src/lib.rs b/rust/trace/src/lib.rs
index 0955461573d..e03bce43c47 100644
--- a/rust/trace/src/lib.rs
+++ b/rust/trace/src/lib.rs
@@ -3,6 +3,10 @@
 //! This crate provides macros that aid in using QEMU's tracepoint
 //! functionality.
 
+#[doc(hidden)]
+/// Re-exported item to avoid adding libc as a dependency everywhere.
+pub use libc::{syslog, LOG_INFO};
+
 #[macro_export]
 /// Define the trace-points from the named directory (which should have slashes
 /// replaced by underscore characters) as functions in a module called `trace`.
diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
index 177414d56a6..12b826593db 100644
--- a/scripts/tracetool/backend/syslog.py
+++ b/scripts/tracetool/backend/syslog.py
@@ -12,7 +12,7 @@
 __email__      = "stefanha@redhat.com"
 
 
-from tracetool import out
+from tracetool import out, expand_format_string
 
 
 PUBLIC = True
@@ -38,6 +38,11 @@ def generate_h(event, group):
         fmt=event.fmt.rstrip("\n"),
         argnames=argnames)
 
+def generate_rs(event, group):
+    out('        let format_string = c"%(fmt)s";',
+        '        unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, %(args)s);}',
+        fmt=expand_format_string(event.fmt),
+        args=event.args.rust_call_varargs())
 
 def generate_h_backend_dstate(event, group):
     out('    trace_event_get_state_dynamic_by_id(%(event_id)s) || \\',
diff --git a/tests/tracetool/syslog.rs b/tests/tracetool/syslog.rs
new file mode 100644
index 00000000000..9d3675a0b57
--- /dev/null
+++ b/tests/tracetool/syslog.rs
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// This file is @generated by tracetool, do not edit.
+
+#[allow(unused_imports)]
+use std::ffi::c_char;
+#[allow(unused_imports)]
+use util::bindings;
+
+#[inline(always)]
+fn trace_event_state_is_enabled(dstate: u16) -> bool {
+    (unsafe { trace_events_enabled_count }) != 0 && dstate != 0
+}
+
+extern "C" {
+    static mut trace_events_enabled_count: u32;
+}
+extern "C" {
+    static mut _TRACE_TEST_BLAH_DSTATE: u16;
+    static mut _TRACE_TEST_WIBBLE_DSTATE: u16;
+}
+
+#[inline(always)]
+#[allow(dead_code)]
+pub fn trace_test_blah(_context: *mut (), _filename: &std::ffi::CStr)
+{
+    if trace_event_state_is_enabled(unsafe { _TRACE_TEST_BLAH_DSTATE}) {
+        let format_string = c"Blah context=%p filename=%s";
+        unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _filename.as_ptr());}
+    }
+}
+
+#[inline(always)]
+#[allow(dead_code)]
+pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
+{
+    if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
+        let format_string = c"Wibble context=%p value=%d";
+        unsafe {::trace::syslog(::trace::LOG_INFO, format_string.as_ptr() as *const c_char, _context /* as *mut () */, _value /* as std::ffi::c_int */);}
+    }
+}
diff --git a/tests/tracetool/tracetool-test.py b/tests/tracetool/tracetool-test.py
index 3341fb18f90..786083ad7fb 100755
--- a/tests/tracetool/tracetool-test.py
+++ b/tests/tracetool/tracetool-test.py
@@ -14,7 +14,7 @@ def get_formats(backend):
         "c",
         "h",
     ]
-    if backend in {"ftrace", "log", "simple"}:
+    if backend in {"ftrace", "log", "simple", "syslog"}:
         formats += ["rs"]
     if backend == "dtrace":
         formats += [
-- 
2.51.0


