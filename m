Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRh-0007GO-Tr
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRd-0006wX-9d
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRb-0001Rl-OH
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KajmiXkvjrUlRNrAa7EleOjJePFNbnltU4TduUDEJc=;
 b=g3rFdUgSMMp3rai3jgR5fJzRWDORFnPV2G2fC5YSjsPei5Z/F0DPXIx615kA4c2B+Z9Elc
 FciQuyyo90GiGoh9RId1ZIxFhqC4PpaE0EyRzCBPojO8k7l16qg2eHv1RCX+CUpIzTaEFH
 oN9fQAxaNlvahbSow1UvRmlxWP7R684=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-HdeJiBfiO0KVygJjFbjypw-1; Fri, 21 Feb 2025 12:04:03 -0500
X-MC-Unique: HdeJiBfiO0KVygJjFbjypw-1
X-Mimecast-MFC-AGG-ID: HdeJiBfiO0KVygJjFbjypw_1740157442
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38f2726c0faso2440730f8f.0
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157441; x=1740762241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KajmiXkvjrUlRNrAa7EleOjJePFNbnltU4TduUDEJc=;
 b=qRS/Jf/LsThXYDjwJkS7zkP9wU/fH8oD541d7ZozoNPoN0zCTbtSP+Pgy4x4Nq7otq
 QEJiSYBwyAAdeSDxQntAjIzFq9a63ER8M9WzMN1F+Wc5MWgVs8Za7C/8RUa2oaam7G9H
 uB/VMqXQ3k7GqZcDygHaTdlTzJ9qupEXWsJQkhse7TAYfEZRxI7o2vvCrX+4OHm0bY+l
 Wy8X4iu1S9hOOq4igIyLI5xRmaVKSv+xOgv4AGGjdK4F5za3aRBDHJEsFHPG1cPB9hC1
 aFnIRdJ90F+LFnS3Wiaun5QUGpU6bHWAGKZPOq1/Pfo1QMrkp7P52zKY+1CMHz0ZUedW
 BohA==
X-Gm-Message-State: AOJu0YzBRzE/tx5nD7N+AjTCvmQfb7Rttf+cQ9ByIxlyJKDWDFMwI/H4
 Mg42y6TdkOshdyssACB8gUt+QQvoZHPM/WYDALmtXqzhWLT/k1kzrK8f3ywCw1F9iyt44/PlZ2e
 TIEvvDl3KFm/xVD3fu+RcspChpnyBn5L73HdQnfBuCseqjwPCAuP4rRvZdDhpUw==
X-Gm-Gg: ASbGncso9lrrUt/DfxJ0r6qN73tLq+jmuoyJe7tOrWruACENSw42ZIc/sp3bs38gcPf
 4pqT53mk82IRf9vvkZwQx38tLqYED54hk3MAUELNGv7k0L+xWBcusb2OaqK1/d/P5iY8MRGRplb
 T5V11X67aTOEZVanmi/0TmRxwG8P/M50TkriojBOp76M3ok1MOLzdRqYBI5jy/xR8HAnDxYU2CB
 N3uYvEVoO5wC3gyzSNCCaONOtRv4JO2umC4yNXPxou0bME6/166ra/SxGbrwpgNyq9a0fvH6AXA
 LxELFkQPqyLNCtdCc0w=
X-Received: by 2002:a5d:59ad:0:b0:38f:30c7:eae4 with SMTP id
 ffacd0b85a97d-38f6f0c289emr3369800f8f.52.1740157441190; 
 Fri, 21 Feb 2025 09:04:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Rqw5HLoCQNAcp/eBta75SgW0yjnziketJS8tDJpcLwitcrgIL/4Kh4z5OBz53O2IsmHRWw==
X-Received: by 2002:a5d:59ad:0:b0:38f:30c7:eae4 with SMTP id
 ffacd0b85a97d-38f6f0c289emr3369718f8f.52.1740157440502; 
 Fri, 21 Feb 2025 09:04:00 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f252dsm22580065e9.22.2025.02.21.09.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:04:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 08/15] rust: timer: wrap QEMUTimer with Opaque<>
Date: Fri, 21 Feb 2025 18:03:35 +0100
Message-ID: <20250221170342.63591-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GgTWTGRsYqzwvqLjtkRE7WlryN-j9giQSAJzbISidGQ_1740157442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Feb 2025 17:04:09 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                |  7 -------
 rust/qemu-api/src/timer.rs | 24 +++++++++++++++++-------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 8ed10b6624e..16c76c493f3 100644
--- a/meson.build
+++ b/meson.build
@@ -4087,13 +4087,6 @@ if have_rust
   foreach enum : c_bitfields
     bindgen_args += ['--bitfield-enum', enum]
   endforeach
-  c_nocopy = [
-    'QEMUTimer',
-  ]
-  # Used to customize Drop trait
-  foreach struct : c_nocopy
-    bindgen_args += ['--no-copy', struct]
-  endforeach
 
   # TODO: Remove this comment when the clang/libclang mismatch issue is solved.
   #
diff --git a/rust/qemu-api/src/timer.rs b/rust/qemu-api/src/timer.rs
index a593538917a..0305a0385ad 100644
--- a/rust/qemu-api/src/timer.rs
+++ b/rust/qemu-api/src/timer.rs
@@ -7,10 +7,23 @@
 use crate::{
     bindings::{self, qemu_clock_get_ns, timer_del, timer_init_full, timer_mod, QEMUClockType},
     callbacks::FnCall,
+    cell::Opaque,
 };
 
-pub type Timer = bindings::QEMUTimer;
-pub type TimerListGroup = bindings::QEMUTimerListGroup;
+/// A safe wrapper around [`bindings::QEMUTimer`].
+#[repr(transparent)]
+#[derive(Debug, Default, qemu_api_macros::Wrapper)]
+pub struct Timer(Opaque<bindings::QEMUTimer>);
+
+unsafe impl Send for Timer {}
+unsafe impl Sync for Timer {}
+
+#[repr(transparent)]
+#[derive(qemu_api_macros::Wrapper)]
+pub struct TimerListGroup(Opaque<bindings::QEMUTimerListGroup>);
+
+unsafe impl Send for TimerListGroup {}
+unsafe impl Sync for TimerListGroup {}
 
 impl Timer {
     pub const MS: u32 = bindings::SCALE_MS;
@@ -21,10 +34,6 @@ pub fn new() -> Self {
         Default::default()
     }
 
-    const fn as_mut_ptr(&self) -> *mut Self {
-        self as *const Timer as *mut _
-    }
-
     pub fn init_full<'timer, 'opaque: 'timer, T, F>(
         &'timer mut self,
         timer_list_group: Option<&TimerListGroup>,
@@ -51,7 +60,7 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
         // SAFETY: the opaque outlives the timer
         unsafe {
             timer_init_full(
-                self,
+                self.as_mut_ptr(),
                 if let Some(g) = timer_list_group {
                     g as *const TimerListGroup as *mut _
                 } else {
@@ -75,6 +84,7 @@ pub fn delete(&self) {
     }
 }
 
+// FIXME: use something like PinnedDrop from the pinned_init crate
 impl Drop for Timer {
     fn drop(&mut self) {
         self.delete()
-- 
2.48.1


