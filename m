Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C36CAC5B0
	for <qemu-rust@archiver.kernel.org>; Mon, 29 Sep 2025 15:56:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3G9n-0001cR-7f; Mon, 29 Sep 2025 11:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G9E-00014w-Lq
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3G8u-0000bU-1W
 for qemu-rust@nongnu.org; Mon, 29 Sep 2025 11:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759161015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgeZwtZ6+urHNeNIRfbFDXvW6hsniO1LNpDBTG/PzSo=;
 b=ZlLPverdeJOA1XCinWDokYmuboqfiTpFYKsN4TCF0CMnOqbapXEz3A92wWQKXQXIf22Vbz
 V0/AlBEbRq1L+Gc0m98Cjj1IE0THmPQPU/PV4n5mXWy/Xg1wD8mLDiILVwFuyjdor5w4tZ
 bAbtVRPnJhCKpOvV33/pPcI4Jfol63k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-4fKbE3uXMY2hcefKVWN7sw-1; Mon, 29 Sep 2025 11:50:13 -0400
X-MC-Unique: 4fKbE3uXMY2hcefKVWN7sw-1
X-Mimecast-MFC-AGG-ID: 4fKbE3uXMY2hcefKVWN7sw_1759161013
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-63359dd377cso5551112a12.2
 for <qemu-rust@nongnu.org>; Mon, 29 Sep 2025 08:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759161012; x=1759765812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgeZwtZ6+urHNeNIRfbFDXvW6hsniO1LNpDBTG/PzSo=;
 b=HDudEjl1dZ5jTxbsV+SaddvcdE9AYSMaCnh2qHe3g/3CCMdoq6RTZqkPPJc3ulN5Au
 bHyF+oBUCj9dklFbKasIR2AMvz7ybwGydBWRBK4UnFBVJ5H/aMtDEslLR9+KBTH6K5DJ
 RM5Hz0vR2YdzFB5UcZmTkm9/sNg2LQT5DxShEvdlc8rx9ZXx1LfuJvI+rMI2Ux1dv9vE
 G6SKgb2gXudD2cuX2sPIXs5xCaiHJ7c3c9fYKZkO2LED79P5YXNemCfi6hvKO/tUbf2Q
 f51uaIeUGmAe8KMYKKCRc8j6SG8muYLKQTUTClGG5eGr+FmEQ9121r2bvBpSOGpKBsX7
 ensQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFtYVpuTse7k2Xyn0jKOdCEVJcdFkzuOPDc6aZhEALtUCDlxBv4IcXRVs1a/yGoNhEml+sCuDulCk=@nongnu.org
X-Gm-Message-State: AOJu0YyGzBeNtfWYVGfvAaj5qHqBgn2W2/z70TvHfFNB3cG6EMJTQ/Bw
 5/3rcDYgqr4u4U/ZUXowl++ytt2O4/CTC91i/Ve3SsbkYF8DQbFoWQVbIWFLbFji1rnd1B8+GfF
 gXkgIJLwUbrNcfnclnuSGQxdVEj47DKOy9TvVEbl8vy3uCSQau11rbbc=
X-Gm-Gg: ASbGncuAfxKZ4Eb7uvKMdYMqsnz8THTQJS3xDrz/v64gBUegha91kV5TySYQ9D9lXnE
 qhhLbh2zXeDTIPTnF93Vg1erTJgo1kzpT0GRKV+J5Jlimi23DuM9Xj73U7HeMsY8ykroghsf2y1
 6uucn1lhHYa3FVidCnI0fEDUTp37Bl5ud7w+Qw8hmIoxMIJYjvO2UGh+wo6IMj15bbspASc62QV
 U2NATC+xftV5/fH5+hP4k8/TCtFrIvwflUALpkJnHHToQn5TDI30V4cQBE6O1w7RdKS+VJtoAmo
 SVUx36QchNJZxnu8zEJvqaeMO01m/x/y/UzfWFedYlN3Lt8o7SrYGAKktOcTB3+AuCUD9np2hC2
 0cxSYIdzW+D8HaC1WVtLbrZvnkUcNeA02SbYVGYZkBalPDg==
X-Received: by 2002:a17:906:6a0c:b0:b3f:a16d:da7b with SMTP id
 a640c23a62f3a-b3fa16ddfd2mr338143466b.8.1759161012540; 
 Mon, 29 Sep 2025 08:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3jWHmTgmkjus/DPpqJcmXBoTx4EXB8vKy6gsv6LkxkeSrL5dDo40U8Pvy4Hq5RkvH9JBF1w==
X-Received: by 2002:a17:906:6a0c:b0:b3f:a16d:da7b with SMTP id
 a640c23a62f3a-b3fa16ddfd2mr338139766b.8.1759161012037; 
 Mon, 29 Sep 2025 08:50:12 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d277598bdsm332944966b.3.2025.09.29.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:50:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tanish Desai <tanishdesai37@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-rust@nongnu.org
Subject: [PATCH 12/16] tracetool/simple: add Rust support
Date: Mon, 29 Sep 2025 17:49:34 +0200
Message-ID: <20250929154938.594389-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929154938.594389-1-pbonzini@redhat.com>
References: <20250929154938.594389-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: luIvgTECLe-gkwLxRxahHIuLORh9T2pw91tdb1u0TDs_1759161013
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
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Tanish Desai <tanishdesai37@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/tracetool/backend/simple.py |  7 +++++
 tests/tracetool/simple.rs           | 40 +++++++++++++++++++++++++++++
 tests/tracetool/tracetool-test.py   |  2 ++
 3 files changed, 49 insertions(+)
 create mode 100644 tests/tracetool/simple.rs

diff --git a/scripts/tracetool/backend/simple.py b/scripts/tracetool/backend/simple.py
index b5a6b7205a3..b131e4fc194 100644
--- a/scripts/tracetool/backend/simple.py
+++ b/scripts/tracetool/backend/simple.py
@@ -98,3 +98,10 @@ def generate_c(event, group):
     out('    trace_record_finish(&rec);',
         '}',
         '')
+
+def generate_rs(event, group):
+    out('        extern "C" { fn _simple_%(api)s(%(rust_args)s); }',
+        '        unsafe { _simple_%(api)s(%(args)s); }',
+        api=event.api(),
+        rust_args=event.args.rust_decl_extern(),
+        args=event.args.rust_call_extern())
diff --git a/tests/tracetool/simple.rs b/tests/tracetool/simple.rs
new file mode 100644
index 00000000000..9ee39495e38
--- /dev/null
+++ b/tests/tracetool/simple.rs
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
+        extern "C" { fn _simple_trace_test_blah(_context: *mut (), _filename: *const std::ffi::c_char); }
+        unsafe { _simple_trace_test_blah(_context, _filename.as_ptr()); }
+    }
+}
+
+#[inline(always)]
+#[allow(dead_code)]
+pub fn trace_test_wibble(_context: *mut (), _value: std::ffi::c_int)
+{
+    if trace_event_state_is_enabled(unsafe { _TRACE_TEST_WIBBLE_DSTATE}) {
+        extern "C" { fn _simple_trace_test_wibble(_context: *mut (), _value: std::ffi::c_int); }
+        unsafe { _simple_trace_test_wibble(_context, _value); }
+    }
+}
diff --git a/tests/tracetool/tracetool-test.py b/tests/tracetool/tracetool-test.py
index 65430fdedc1..3e37890476d 100755
--- a/tests/tracetool/tracetool-test.py
+++ b/tests/tracetool/tracetool-test.py
@@ -14,6 +14,8 @@ def get_formats(backend):
         "c",
         "h",
     ]
+    if backend in {"simple"}:
+        formats += ["rs"]
     if backend == "dtrace":
         formats += [
             "d",
-- 
2.51.0


