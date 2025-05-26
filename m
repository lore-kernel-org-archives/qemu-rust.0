Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJYlx-0003KH-8n
	for mharc-qemu-rust@gnu.org; Mon, 26 May 2025 10:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlW-0002ze-5J
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uJYlT-0007rY-2i
 for qemu-rust@nongnu.org; Mon, 26 May 2025 10:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748269518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEirfICDV2iUFGeoHG7Gn3nAmnYWGEW5yhNDMIdDw0M=;
 b=TKiHN/0RasyI4ekDZmbPz7lfoI+gESpAewACLZaZ8/UcmZp4ICD5sAfJ1mFjBmx5SJr+01
 6PZ707ELool/5oFDzM5m/iEeU6n+3knnIKTDeMMj96htPaDBgQqslfyuVZjvlBXpTYCTWN
 VubhoSeOkTz4yZ9rPHZ79XtYibH+pr4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-c_pi6aijP5q5Cc5py80Z1A-1; Mon, 26 May 2025 10:25:17 -0400
X-MC-Unique: c_pi6aijP5q5Cc5py80Z1A-1
X-Mimecast-MFC-AGG-ID: c_pi6aijP5q5Cc5py80Z1A_1748269516
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-442f90418b0so12594535e9.2
 for <qemu-rust@nongnu.org>; Mon, 26 May 2025 07:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748269515; x=1748874315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yEirfICDV2iUFGeoHG7Gn3nAmnYWGEW5yhNDMIdDw0M=;
 b=V4LQAJu3QhYclOVZJ39Ny9KKpATVPWzfNklChcK/r+vdvYt/CnM1/S4km3huSuSq7S
 ELh881MJQZYbbZFudVX6ESu+TCsSURV+IhCoLoa9SzwVMl1DWqSRqxBqj3XkZSQdQXb7
 +FMRCGS/AkYbTe7bjb0Q2aldSVyUJJWd+Bn6of/H6+EmfkYLt5qPDJYEXOwlpVWBG1Vp
 Fs6GXkVdiugFoJu2sHMN8GjyB271jlG4b7pFZ1vdvZdB4zxT98MXT9PmCP74Uk35UbHu
 FLitDVJsEMqzEP5ulbJn/utPIULDUu54tzi3F+PVNqbUOeqiUw7vyXs/UVa4tQfJe9k5
 DgwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWq9Q8CVD+xWiQAgPuEfJY3B3aOgcwIaUMEgnyY07HJWAqem7l69SVRyW3Nm3ONWqOQxgMPwaJKFE=@nongnu.org
X-Gm-Message-State: AOJu0YyVRqSpoe4PXGA1L3edHjkazqllAm7WOE/9LUgWevcsl3Z9SHah
 WryB8HRg7OT6edYOpODtT58VKXsK7lxylYfagCNjQCkbdj0na2kzFROnVyBxiVfZcNZ4x6g7d5P
 p4+qlU8tmG9OnLtaxfw+ohp3ntyol7Y5878TiJGn0RyTkPXr9BesaT+qkrTxSAkk=
X-Gm-Gg: ASbGnctGc0N7p1VbzOAXZDbSQOhLHMKHaLqi7Gram0phEtTtk+4Q2M2OvsMkKhxNlCs
 wEqGemeihmyhlwTWpuyIGle5D02vD4AL+jvr6Q/HUeahGLMTgq+lAbbMGnZS5oG3XVrn/QwfSLt
 1i9+Plo3U0H4549kMOr/ge0+24KcD0/VKqSk3q5PcTyMEA5birrxHwcsOof8e5KUr/oE3iNjaAs
 egmCxhauLQF6TUJIr7+E+dP4RbkU8Vn0UPPHy5Kl3EN4315QRBEtb+yeJwIKdHn+zpLPUbMqyfC
 /+aTtVR28th18g==
X-Received: by 2002:a05:600c:1da6:b0:44a:4874:bdde with SMTP id
 5b1f17b1804b1-44c8ed8f474mr89520805e9.0.1748269514815; 
 Mon, 26 May 2025 07:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvFQhU736uPEHz30h8XKYQwp60N+KklBTccvOgW4W5S3cXm93i6WcOt9PK66MdDozUqztwEQ==
X-Received: by 2002:a05:600c:1da6:b0:44a:4874:bdde with SMTP id
 5b1f17b1804b1-44c8ed8f474mr89520605e9.0.1748269514409; 
 Mon, 26 May 2025 07:25:14 -0700 (PDT)
Received: from [192.168.122.1] ([151.95.46.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f18251basm235241585e9.4.2025.05.26.07.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 07:25:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-rust@nongnu.org
Subject: [PATCH 08/12] rust: qdev: support returning errors from realize
Date: Mon, 26 May 2025 16:24:51 +0200
Message-ID: <20250526142455.1061519-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526142254.1061009-1-pbonzini@redhat.com>
References: <20250526142254.1061009-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlhJW0zL4Ib31gyDs0ppNpwW7DmOBByiUhxq00Sz57A_1748269516
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.903,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 26 May 2025 14:25:35 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  5 +++--
 rust/hw/timer/hpet/src/hpet.rs   |  5 +++--
 rust/qemu-api/src/qdev.rs        | 10 ++++++----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index bde3be65c5b..95fe9a34cd2 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -175,7 +175,7 @@ fn properties() -> &'static [Property] {
     fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&device_class::VMSTATE_PL011)
     }
-    const REALIZE: Option<fn(&Self)> = Some(Self::realize);
+    const REALIZE: Option<fn(&Self) -> qemu_api::Result<()>> = Some(Self::realize);
 }
 
 impl ResettablePhasesImpl for PL011State {
@@ -619,9 +619,10 @@ fn event(&self, event: Event) {
         }
     }
 
-    fn realize(&self) {
+    fn realize(&self) -> qemu_api::Result<()> {
         self.char_backend
             .enable_handlers(self, Self::can_receive, Self::receive, Self::event);
+        Ok(())
     }
 
     fn reset_hold(&self, _type: ResetType) {
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index 779681d6509..55eef669a9d 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -724,7 +724,7 @@ fn post_init(&self) {
         }
     }
 
-    fn realize(&self) {
+    fn realize(&self) -> qemu_api::Result<()> {
         if self.int_route_cap == 0 {
             // TODO: Add error binding: warn_report()
             println!("Hpet's hpet-intcap property not initialized");
@@ -751,6 +751,7 @@ fn realize(&self) {
 
         self.init_gpio_in(2, HPETState::handle_legacy_irq);
         self.init_gpio_out(from_ref(&self.pit_enabled));
+        Ok(())
     }
 
     fn reset_hold(&self, _type: ResetType) {
@@ -1042,7 +1043,7 @@ fn vmsd() -> Option<&'static VMStateDescription> {
         Some(&VMSTATE_HPET)
     }
 
-    const REALIZE: Option<fn(&Self)> = Some(Self::realize);
+    const REALIZE: Option<fn(&Self) -> qemu_api::Result<()>> = Some(Self::realize);
 }
 
 impl ResettablePhasesImpl for HPETState {
diff --git a/rust/qemu-api/src/qdev.rs b/rust/qemu-api/src/qdev.rs
index 1279d7a58d5..81052097071 100644
--- a/rust/qemu-api/src/qdev.rs
+++ b/rust/qemu-api/src/qdev.rs
@@ -12,10 +12,11 @@
 pub use bindings::{ClockEvent, DeviceClass, Property, ResetType};
 
 use crate::{
-    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, Error, ResettableClass},
+    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, ResettableClass},
     callbacks::FnCall,
     cell::{bql_locked, Opaque},
     chardev::Chardev,
+    error::{Error, Result},
     irq::InterruptSource,
     prelude::*,
     qom::{ObjectClass, ObjectImpl, Owned},
@@ -108,7 +109,7 @@ pub trait DeviceImpl: ObjectImpl + ResettablePhasesImpl + IsA<DeviceState> {
     ///
     /// If not `None`, the parent class's `realize` method is overridden
     /// with the function pointed to by `REALIZE`.
-    const REALIZE: Option<fn(&Self)> = None;
+    const REALIZE: Option<fn(&Self) -> Result<()>> = None;
 
     /// An array providing the properties that the user can set on the
     /// device.  Not a `const` because referencing statics in constants
@@ -134,10 +135,11 @@ fn vmsd() -> Option<&'static VMStateDescription> {
 /// readable/writeable from one thread at any time.
 unsafe extern "C" fn rust_realize_fn<T: DeviceImpl>(
     dev: *mut bindings::DeviceState,
-    _errp: *mut *mut Error,
+    errp: *mut *mut bindings::Error,
 ) {
     let state = NonNull::new(dev).unwrap().cast::<T>();
-    T::REALIZE.unwrap()(unsafe { state.as_ref() });
+    let result = T::REALIZE.unwrap()(unsafe { state.as_ref() });
+    unsafe { Error::ok_or_propagate(result, errp); }
 }
 
 unsafe impl InterfaceType for ResettableClass {
-- 
2.49.0


