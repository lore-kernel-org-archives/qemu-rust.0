Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF20D37E3B
	for <qemu-rust@archiver.kernel.org>; Wed, 14 Jan 2026 13:50:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vg1Fh-0008LL-Ds; Wed, 14 Jan 2026 08:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg1Fg-0008JA-AK
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 08:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vg1Fe-0002H5-Fz
 for qemu-rust@nongnu.org; Wed, 14 Jan 2026 08:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768398572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrMf5KEy7l8I9I0C7YHruq+Mnzy9WjT6abXoIiW6jCg=;
 b=J5RRBo8jYBG4lqwWr5bFeVKGEmfLVU4P9lalj+kLFzl12dog9RKxrBSuUO3gbOGZ2h1qgc
 tCXC62EkgwwnfAT3NIJkLhfYI5NtkCOLQOir1NEjoXTLjI7UPxjBQmvkAGiQzpo8p8G9OH
 Nmtl/OZwbPoiZNvWntYSoyTKe6jjnB0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-RRRSIXD0Obe8oavqpfVu6g-1; Wed, 14 Jan 2026 08:49:28 -0500
X-MC-Unique: RRRSIXD0Obe8oavqpfVu6g-1
X-Mimecast-MFC-AGG-ID: RRRSIXD0Obe8oavqpfVu6g_1768398564
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-430fc153d50so6428472f8f.1
 for <qemu-rust@nongnu.org>; Wed, 14 Jan 2026 05:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768398564; x=1769003364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rrMf5KEy7l8I9I0C7YHruq+Mnzy9WjT6abXoIiW6jCg=;
 b=h12vjKsI1OHKgdkntdbWWTkHB8ecvWf1tLCffhYafyTnUTkc/5N2qpGk7k03YDbFIf
 YjYNIFgQmIYrCkGedUrugLVecjpcrxPWoyGAQ3y7JfwktSH8GNhgv1CiIjSie736oNAO
 c3z/+cXZsZHEsilBhZr5Q0DHBqUn2Wu0N/dJRuK42tRPtc36xV1HnTULtuOrUl/waOND
 tN6WFjO6K6NG+28bZt/ozx2PYf+DKkAM6QtMNCAgydhbGg+mBSMZp6mprZ9J0yC5Pq6J
 frBiE2jIcLNuR5j0KfYudNczjvFPd8+2AsIEPCK4nAt3K8GOn+OpjEj5so0aeZ+W+EhW
 P1YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwF3C1FaENSjtBJlEl281oZqZVse+Rf4XpOoSq5etigF5O+vzUx9WvWX4v/Vc/uq/7hvQEDvQ3tcA=@nongnu.org
X-Gm-Message-State: AOJu0YzcDD+Fcix48Cf/xS8pc0Ko6y6QfFVrjPespn69Ti/Fo1Az3Qss
 CbcZAxDpIai5+Ob1ObbW8nKwF7aWomrdDhcAb/IpRQZ873t2GvU3cidnYDvrqbqhauim2YEXF+2
 wc1wCDmoBeE/G2WOfh6u2Gp1bT7oEq47fo9E50Dv7V2jqdRWWdHNcw0Y=
X-Gm-Gg: AY/fxX5vmIWN85/tgW1aBhSn1cP4kmc9L058/DMW0ULhfqKh6svbcpOnxfEcGuIupS7
 3w1CLHbd0wSQbSabIIfOPw9tRLNBBxelJcwbhVYgdwcvPb2g8gwNJeISdmMk7eCJLfeRJb4tlsR
 MtXjJ3ffY/zb7aEpF520G2L5tjn12/l8f6rRfJUMNxV7N9mz5MIv73kXvBnfPSPjYspEBNgOlno
 gm0albp18jhyhIEiebS9bckX8kV/Y/G8SO5vFjyCBxGrIeV/yGkmZiDzvx8Jf6YZAGzH1pZwVTn
 zABU/dFE9jJzTl2AkUi/Y+pc6dfk41LWDKaXExP2G8F0al2NhzLGvUYTWcHn4+UEZW3RMoFY0qw
 BmLz8/nDd2yZypVVb4Zwa1wFT9maWGUatO0dG6b/2JlEEe49UmD69Cc0GLbBK4mysOIl7xZYU7Y
 aDuSfQ6rCs9AhWQg==
X-Received: by 2002:a05:6000:290e:b0:430:f5dc:d34a with SMTP id
 ffacd0b85a97d-4342c543ba7mr3600385f8f.29.1768398564282; 
 Wed, 14 Jan 2026 05:49:24 -0800 (PST)
X-Received: by 2002:a05:6000:290e:b0:430:f5dc:d34a with SMTP id
 ffacd0b85a97d-4342c543ba7mr3600347f8f.29.1768398563778; 
 Wed, 14 Jan 2026 05:49:23 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm51726274f8f.13.2026.01.14.05.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 05:49:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	qemu-rust@nongnu.org,
	marcandre.lureau@redhat.com
Subject: [PATCH 1/3] rust: move class_init to an extension trait
Date: Wed, 14 Jan 2026 14:49:17 +0100
Message-ID: <20260114134919.1476518-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114134919.1476518-1-pbonzini@redhat.com>
References: <20260114134919.1476518-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sGk8GWsF3MGB2fNXptA75irEK1CeaQagf6D5Tv6JuVY_1768398564
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

Prepare for having ObjectClass, DeviceClass and SysbusDeviceClass
defined outside the hwcore and qom crates.  It then becomes
impossible to add a method to them.

Extracted from a patch by Marc-André Lureau.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/core/src/prelude.rs |  3 +++
 rust/hw/core/src/qdev.rs    | 25 +++++++++++++++----------
 rust/hw/core/src/sysbus.rs  | 10 +++++++---
 rust/qom/src/prelude.rs     |  1 +
 rust/qom/src/qom.rs         |  8 ++++++--
 5 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/rust/hw/core/src/prelude.rs b/rust/hw/core/src/prelude.rs
index c544c317b39..13f7dfc6809 100644
--- a/rust/hw/core/src/prelude.rs
+++ b/rust/hw/core/src/prelude.rs
@@ -1,6 +1,8 @@
 //! Essential types and traits intended for blanket imports.
 
 pub use crate::qdev::Clock;
+
+pub use crate::qdev::DeviceClassExt;
 pub use crate::qdev::DeviceState;
 pub use crate::qdev::DeviceImpl;
 pub use crate::qdev::DeviceMethods;
@@ -8,6 +10,7 @@
 pub use crate::qdev::ResetType;
 
 pub use crate::sysbus::SysBusDevice;
+pub use crate::sysbus::SysBusDeviceClassExt;
 pub use crate::sysbus::SysBusDeviceImpl;
 pub use crate::sysbus::SysBusDeviceMethods;
 
diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
index 87232becbad..f6037fbdcae 100644
--- a/rust/hw/core/src/qdev.rs
+++ b/rust/hw/core/src/qdev.rs
@@ -15,9 +15,9 @@
 use qom::{prelude::*, ObjectClass};
 use util::{Error, Result};
 
-pub use crate::bindings::{ClockEvent, DeviceClass, Property, ResetType};
+pub use crate::bindings::{ClockEvent, ResetType};
 use crate::{
-    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, ResettableClass},
+    bindings::{self, qdev_init_gpio_in, qdev_init_gpio_out, DeviceClass, Property},
     irq::InterruptSource,
 };
 
@@ -206,6 +206,9 @@ pub trait DeviceImpl:
     }
 }
 
+#[repr(transparent)]
+pub struct ResettableClass(bindings::ResettableClass);
+
 unsafe impl InterfaceType for ResettableClass {
     const TYPE_NAME: &'static CStr =
         unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_RESETTABLE_INTERFACE) };
@@ -214,23 +217,25 @@ unsafe impl InterfaceType for ResettableClass {
 impl ResettableClass {
     /// Fill in the virtual methods of `ResettableClass` based on the
     /// definitions in the `ResettablePhasesImpl` trait.
-    pub fn class_init<T: ResettablePhasesImpl>(&mut self) {
+    fn class_init<T: ResettablePhasesImpl>(&mut self) {
         if <T as ResettablePhasesImpl>::ENTER.is_some() {
-            self.phases.enter = Some(rust_resettable_enter_fn::<T>);
+            self.0.phases.enter = Some(rust_resettable_enter_fn::<T>);
         }
         if <T as ResettablePhasesImpl>::HOLD.is_some() {
-            self.phases.hold = Some(rust_resettable_hold_fn::<T>);
+            self.0.phases.hold = Some(rust_resettable_hold_fn::<T>);
         }
         if <T as ResettablePhasesImpl>::EXIT.is_some() {
-            self.phases.exit = Some(rust_resettable_exit_fn::<T>);
+            self.0.phases.exit = Some(rust_resettable_exit_fn::<T>);
         }
     }
 }
 
-impl DeviceClass {
-    /// Fill in the virtual methods of `DeviceClass` based on the definitions in
-    /// the `DeviceImpl` trait.
-    pub fn class_init<T: DeviceImpl>(&mut self) {
+pub trait DeviceClassExt {
+    fn class_init<T: DeviceImpl>(&mut self);
+}
+
+impl DeviceClassExt for DeviceClass {
+    fn class_init<T: DeviceImpl>(&mut self) {
         if <T as DeviceImpl>::REALIZE.is_some() {
             self.realize = Some(rust_realize_fn::<T>);
         }
diff --git a/rust/hw/core/src/sysbus.rs b/rust/hw/core/src/sysbus.rs
index 071fccff1e6..81fab3f1910 100644
--- a/rust/hw/core/src/sysbus.rs
+++ b/rust/hw/core/src/sysbus.rs
@@ -15,7 +15,7 @@
 use crate::{
     bindings,
     irq::{IRQState, InterruptSource},
-    qdev::{DeviceImpl, DeviceState},
+    qdev::{DeviceClassExt, DeviceImpl, DeviceState},
 };
 
 /// A safe wrapper around [`bindings::SysBusDevice`].
@@ -37,10 +37,14 @@ unsafe impl ObjectType for SysBusDevice {
 // TODO: add virtual methods
 pub trait SysBusDeviceImpl: DeviceImpl + IsA<SysBusDevice> {}
 
-impl SysBusDeviceClass {
+pub trait SysBusDeviceClassExt {
+    fn class_init<T: SysBusDeviceImpl>(&mut self);
+}
+
+impl SysBusDeviceClassExt for SysBusDeviceClass {
     /// Fill in the virtual methods of `SysBusDeviceClass` based on the
     /// definitions in the `SysBusDeviceImpl` trait.
-    pub fn class_init<T: SysBusDeviceImpl>(self: &mut SysBusDeviceClass) {
+    fn class_init<T: SysBusDeviceImpl>(&mut self) {
         self.parent_class.class_init::<T>();
     }
 }
diff --git a/rust/qom/src/prelude.rs b/rust/qom/src/prelude.rs
index 6a1ecaef2a7..1d1177f1e0d 100644
--- a/rust/qom/src/prelude.rs
+++ b/rust/qom/src/prelude.rs
@@ -4,6 +4,7 @@
 pub use crate::qom::IsA;
 pub use crate::qom::Object;
 pub use crate::qom::ObjectCast;
+pub use crate::qom::ObjectClassExt;
 pub use crate::qom::ObjectClassMethods;
 pub use crate::qom::ObjectDeref;
 pub use crate::qom::ObjectImpl;
diff --git a/rust/qom/src/qom.rs b/rust/qom/src/qom.rs
index 84455cea79b..cc00ddcfc98 100644
--- a/rust/qom/src/qom.rs
+++ b/rust/qom/src/qom.rs
@@ -729,10 +729,14 @@ pub trait ObjectImpl: ObjectType + IsA<Object> {
     T::UNPARENT.unwrap()(unsafe { state.as_ref() });
 }
 
-impl ObjectClass {
+pub trait ObjectClassExt {
+    fn class_init<T: ObjectImpl>(&mut self);
+}
+
+impl ObjectClassExt for ObjectClass {
     /// Fill in the virtual methods of `ObjectClass` based on the definitions in
     /// the `ObjectImpl` trait.
-    pub fn class_init<T: ObjectImpl>(&mut self) {
+    fn class_init<T: ObjectImpl>(&mut self) {
         if <T as ObjectImpl>::UNPARENT.is_some() {
             self.unparent = Some(rust_unparent_fn::<T>);
         }
-- 
2.52.0


