Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnemt-0004Yv-H1
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 09:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemc-0003q9-Cp
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnemX-00045L-VO
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 09:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740666153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nk4rG8BvOrBCUFxfsl3zj+sJAUqBN7gnD9BX4ggHZ8E=;
 b=MMo0cPm0w7spKm3tsDRyvAw7Hr3vCmikbrWuWvjf9xjurps6fIn4Sdah9OD+Rnp/4cxMqx
 fBw/4HG6egTLVqHiiy2FYdIyFhogEdVaeWl0eV1gtIcxFhx5E99iYDeTcbPycarE0L6CSN
 RXky15+MEzWjMnErLSws9fa6nzoO2NU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-4yD6BkbiNGuN6fo9ZKjmoQ-1; Thu, 27 Feb 2025 09:22:31 -0500
X-MC-Unique: 4yD6BkbiNGuN6fo9ZKjmoQ-1
X-Mimecast-MFC-AGG-ID: 4yD6BkbiNGuN6fo9ZKjmoQ_1740666151
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-abf2185ecbcso15518866b.3
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 06:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740666150; x=1741270950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nk4rG8BvOrBCUFxfsl3zj+sJAUqBN7gnD9BX4ggHZ8E=;
 b=IBTdprFhu/iVp1NUckJfblqeNEoS7oVRIgFDXXB1vEcZXoLNk/EJacoTqoKx14DUsV
 dcvU/UjUVsXIrVxUEW7mmktp+q8u8JpBy1sHHEZ9rEW1QUyYbX4sZY/msPgpWsrGumlF
 1lYPmZF21//qJqIMoLCVy4qOSmYKV/b+V2SHT/oGR5lXlVM3WgIFVsMF5QX5gcCwkdo0
 pY18GzsdieJgM9mRTbp+pz4O/J+sBT0ee4jDsIRN2WNMLDNDkoBCQFc8njCYHRvM22Zl
 E5yMpHWVeL2UlFBb7Kh9leO2pp5SRcDekNTiKejYKjz0p+kegK7TVUU0xZQm8K1JPSlV
 Saig==
X-Gm-Message-State: AOJu0YwUxGy1YhMyKGVNKwKrNiMnBkwWHMHdvQc8MRsZJREymaXY+3vQ
 5rvOmFfq613b8G8XmdABwkUFIyo8rqfJICuSdyx/qaGVZPjh+hi+hs3TgjMggCPqoC5Z7mLdnGs
 cVjd+yflEB5UyWf7KWHSuJEYpPUPiAzuEIPU/ntq+Sx1trGP+E1g=
X-Gm-Gg: ASbGncuw8eKoGMEdO+pT3kzgb2hte1vhFUZJ4zpoxPAckSYwwChVX5008SqtaodGdVU
 ddCPkgNyPHBXIIsHs8DB3B0CWutxMvEbybkKLuNhqhUA0QnqDkCXsnL63TCSR+oEEqn0+macK+U
 WBijzKbJQgG7URFSIh+/KZFod4NChZ1YAvQy3Qpjr0qvZpQAG7wvT319q8sJxYYUM+XoR9x3x1q
 Cg9NCpfsuqyhCUbsgo4qNDBaLL+kLs6pU1eqKqJrPIn1YtAyG3vNIbUKe8PdO5Jy5IOFXDaQafu
 LT/QcQ8d4oVfUSvTXBXw
X-Received: by 2002:a17:906:318a:b0:abb:fcbb:ab20 with SMTP id
 a640c23a62f3a-abeeed8bfdcmr836455666b.22.1740666150528; 
 Thu, 27 Feb 2025 06:22:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEre39vytYWAHhZhXaM95fI3eTfMy8Xz3vq9jO0H3LoqMNmrk3eKo/DJWQnPtAQh4wcgpPdlg==
X-Received: by 2002:a17:906:318a:b0:abb:fcbb:ab20 with SMTP id
 a640c23a62f3a-abeeed8bfdcmr836454166b.22.1740666150047; 
 Thu, 27 Feb 2025 06:22:30 -0800 (PST)
Received: from [192.168.10.48] ([176.206.102.52])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4c3fb4384sm1176263a12.49.2025.02.27.06.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:22:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	zhao1.liu@intel.com
Subject: [PATCH 04/12] rust: timer: wrap QEMUTimer with Opaque<> and express
 pinning requirements
Date: Thu, 27 Feb 2025 15:22:11 +0100
Message-ID: <20250227142219.812270-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227142219.812270-1-pbonzini@redhat.com>
References: <20250227142219.812270-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QdPhz-bCj9dm-VQPYKf_LTapy4-89u8hk7JuZhrQp8M_1740666151
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
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
X-List-Received-Date: Thu, 27 Feb 2025 14:22:45 -0000

Timers must be pinned in memory, because modify() stores a pointer to them
in the TimerList.  To ensure this is the case, replace the separate new()
and init_full() with a single function that returns a pinned box.  Because
the only way to obtain a Timer is through Timer::new_full(), modify()
knows that the timer it got is also pinned.  In the future the pinning
requirement will be expressed through the pin_init crate instead.

Note that Timer is a bit different from other users of Opaque, in that
it is created in Rust code rather than C code.  This is why it has to
use the unsafe Opaque::new() function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                    |  7 -----
 rust/hw/timer/hpet/src/hpet.rs | 23 ++++++++---------
 rust/qemu-api/src/timer.rs     | 47 ++++++++++++++++++++++------------
 3 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/meson.build b/meson.build
index 0a2c61d2bfa..fc02e5fc763 100644
--- a/meson.build
+++ b/meson.build
@@ -4098,13 +4098,6 @@ if have_rust
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
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index be27eb0eff4..ce4b289d0c8 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -4,6 +4,7 @@
 
 use std::{
     ffi::CStr,
+    pin::Pin,
     ptr::{addr_of_mut, null_mut, NonNull},
     slice::from_ref,
 };
@@ -156,7 +157,7 @@ pub struct HPETTimer {
     /// timer N index within the timer block (`HPETState`)
     #[doc(alias = "tn")]
     index: usize,
-    qemu_timer: Option<Box<Timer>>,
+    qemu_timer: Option<Pin<Box<Timer>>>,
     /// timer block abstraction containing this timer
     state: Option<NonNull<HPETState>>,
 
@@ -189,18 +190,14 @@ fn init(&mut self, index: usize, state_ptr: *mut HPETState) -> &mut Self {
     }
 
     fn init_timer_with_state(&mut self) {
-        self.qemu_timer = Some(Box::new({
-            let mut t = Timer::new();
-            t.init_full(
-                None,
-                CLOCK_VIRTUAL,
-                Timer::NS,
-                0,
-                timer_handler,
-                &self.get_state().timers[self.index],
-            );
-            t
-        }));
+        self.qemu_timer = Some(Timer::new_full(
+            None,
+            CLOCK_VIRTUAL,
+            Timer::NS,
+            0,
+            timer_handler,
+            &self.get_state().timers[self.index],
+        ));
     }
 
     fn get_state(&self) -> &HPETState {
diff --git a/rust/qemu-api/src/timer.rs b/rust/qemu-api/src/timer.rs
index a593538917a..a8b2ab058b6 100644
--- a/rust/qemu-api/src/timer.rs
+++ b/rust/qemu-api/src/timer.rs
@@ -2,40 +2,51 @@
 // Author(s): Zhao Liu <zhai1.liu@intel.com>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::os::raw::{c_int, c_void};
+use std::{
+    os::raw::{c_int, c_void},
+    pin::Pin,
+};
 
 use crate::{
     bindings::{self, qemu_clock_get_ns, timer_del, timer_init_full, timer_mod, QEMUClockType},
     callbacks::FnCall,
+    cell::Opaque,
 };
 
-pub type Timer = bindings::QEMUTimer;
-pub type TimerListGroup = bindings::QEMUTimerListGroup;
+/// A safe wrapper around [`bindings::QEMUTimer`].
+#[repr(transparent)]
+#[derive(Debug, qemu_api_macros::Wrapper)]
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
     pub const US: u32 = bindings::SCALE_US;
     pub const NS: u32 = bindings::SCALE_NS;
 
-    pub fn new() -> Self {
-        Default::default()
-    }
-
-    const fn as_mut_ptr(&self) -> *mut Self {
-        self as *const Timer as *mut _
-    }
-
-    pub fn init_full<'timer, 'opaque: 'timer, T, F>(
-        &'timer mut self,
+    pub fn new_full<'opaque, T, F>(
         timer_list_group: Option<&TimerListGroup>,
         clk_type: ClockType,
         scale: u32,
         attributes: u32,
         _cb: F,
         opaque: &'opaque T,
-    ) where
+    ) -> Pin<Box<Self>>
         F: for<'a> FnCall<(&'a T,)>,
     {
+        // SAFETY: returning a pinned box makes it certain that the object
+        // will not move when added to a TimerList with `modify()`.
+        let t = unsafe { Box::pin(Self(Opaque::new())) };
         let _: () = F::ASSERT_IS_SOME;
 
         /// timer expiration callback
@@ -51,7 +62,7 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
         // SAFETY: the opaque outlives the timer
         unsafe {
             timer_init_full(
-                self,
+                t.as_mut_ptr(),
                 if let Some(g) = timer_list_group {
                     g as *const TimerListGroup as *mut _
                 } else {
@@ -62,11 +73,14 @@ pub fn init_full<'timer, 'opaque: 'timer, T, F>(
                 attributes as c_int,
                 Some(timer_cb),
                 (opaque as *const T).cast::<c_void>() as *mut c_void,
-            )
+            );
         }
+        t
     }
 
     pub fn modify(&self, expire_time: u64) {
+        // SAFETY: the only way to obtain a Timer is via methods that return a
+        // Pin<Box<Self>>, therefore the timer is pinned
         unsafe { timer_mod(self.as_mut_ptr(), expire_time as i64) }
     }
 
@@ -75,6 +89,7 @@ pub fn delete(&self) {
     }
 }
 
+// FIXME: use something like PinnedDrop from the pinned_init crate
 impl Drop for Timer {
     fn drop(&mut self) {
         self.delete()
-- 
2.48.1


