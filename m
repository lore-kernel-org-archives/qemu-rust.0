Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tlWRW-0006lu-DL
	for mharc-qemu-rust@gnu.org; Fri, 21 Feb 2025 12:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRP-0006iK-JI
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tlWRN-0001Oa-8D
 for qemu-rust@nongnu.org; Fri, 21 Feb 2025 12:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740157432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+2kng6sRFTLtB08RcVigadgRIcXeqRixX2Ql4tgm1M=;
 b=TdCw4qkzt0sa6gRiYt12g18d4gdfolnosUCwmpJzgYG7QCoWKwViAQHJK8X76+whVf19fO
 BDUnxzXjkYKUX8V1IPhhIzdxt3AzfQCiTF3tCkp4xU+FiKg+A81h9iu4PEwgd/ZjuG/efG
 xicuLs5Lv8IiRnF9j8yVKyxlRZ+oBEo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-IBTat3-4NO6c6C3yto7AyA-1; Fri, 21 Feb 2025 12:03:50 -0500
X-MC-Unique: IBTat3-4NO6c6C3yto7AyA-1
X-Mimecast-MFC-AGG-ID: IBTat3-4NO6c6C3yto7AyA_1740157430
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-439385b08d1so15952555e9.1
 for <qemu-rust@nongnu.org>; Fri, 21 Feb 2025 09:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740157430; x=1740762230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G+2kng6sRFTLtB08RcVigadgRIcXeqRixX2Ql4tgm1M=;
 b=tA3slB0a39SguQsYC2NQRbUFI35wzhAB4tdClYvDKF6Zdg7CldVygmgV6nmLD021tf
 f3+scNo9PYslr71lLKdE39UbVp3vGFLCdrV8WFpC4Ous8uhObcjEfFSDVkalTkqOWGAc
 +VDtpZLlYLY6qYnbtDNSPekHJRvjnarwHj4R1ugVMOpjsgILXe7I/yM69JHmHZcPhAfg
 9m/uzZcBMaIbycxSnQdVlDGsnnXTlhZ4zb1PBVtpxMlegFeuBVDMgXs8Ssjgp++OZj9D
 gMZLY93dlu8Np7wzt2FmBreDhiV2D743+rqjTmzNQ0kcMgZrcMoekyXW1pWUzKeBRbk8
 nHxg==
X-Gm-Message-State: AOJu0YzmEvYhKxF9GE4tec7/bDVGnjrXTWE5hI1yTCdGStSbQcM1fP1o
 CMxVmiYDsWOjnci5+cSD/lT8pJBSvidQ6obYpwvgQUyKDNQ3kcSP/+BwuNO9MBZPz8/HY+t/N6s
 4Wx+LjcITLQA4M/FEtSaHXCfyQBTzemVWs8hzCq21TMZFsjfd2so=
X-Gm-Gg: ASbGncuMXKHxozMkQGs73sWvbZG5DrhhsK9nPMMrQZBnMwBSKRT5AjD/BxBBIPr26uT
 GDdy4j6SYiMLuBynvnlSa34581pL+WEffj4YRTrku1Raynrp2t5e6ta3j6TT+tR9VyQPV99XpLB
 olz3qq+q4rPMqvnU9UCL5XWsyOlfHdXdx3mJGK2JkzlDwPGFAtT42a48wHyh5ab3TAQSLbhejpX
 gOUQUmQaOmCQSNnkBj+gNB+99tB7W7+GI6Syvi9+2sRoWLlAsETPdxCmwDxeA7D9KCJDBvayu+x
 fXeW3iOqd1e0AEwf9VM=
X-Received: by 2002:a05:600c:468a:b0:439:87d2:b0fd with SMTP id
 5b1f17b1804b1-439ae1e8dc2mr37053225e9.12.1740157429539; 
 Fri, 21 Feb 2025 09:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq4r8d+X1Ah+8VVeXGPFojGkr0Y/GIJbu2hBMO1Z/gUvvNGqrM95nyK7Hib7qyi4XybK+Evw==
X-Received: by 2002:a05:600c:468a:b0:439:87d2:b0fd with SMTP id
 5b1f17b1804b1-439ae1e8dc2mr37051615e9.12.1740157428223; 
 Fri, 21 Feb 2025 09:03:48 -0800 (PST)
Received: from [192.168.10.48] ([151.95.61.185])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce404sm23182125e9.7.2025.02.21.09.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 09:03:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 03/15] rust: qom: add ObjectImpl::CLASS_INIT
Date: Fri, 21 Feb 2025 18:03:30 +0100
Message-ID: <20250221170342.63591-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221170342.63591-1-pbonzini@redhat.com>
References: <20250221170342.63591-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y1b0tPHWfDjPMaW5KhDnCgK71zi72Jbikvnj7i8T1OI_1740157430
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
X-List-Received-Date: Fri, 21 Feb 2025 17:03:55 -0000

As shown in the PL011 device, the orphan rules required a manual
implementation of ClassInitImpl for anything not in the qemu_api crate;
this gets in the way of moving system emulation-specific code (including
DeviceClass, which as a blanket ClassInitImpl<DeviceClass> implementation)
into its own crate.

Make ClassInitImpl optional, at the cost of having to specify the CLASS_INIT
member by hand in every implementation of ObjectImpl.  The next commits will
get rid of it, replacing all the "impl<T> ClassInitImpl<Class> for T" blocks
with a generic class_init<T> method on Class.

Right now the definition is always the same, but do not provide a default
as that will not be true once ClassInitImpl goes away.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/hw/char/pl011/src/device.rs |  3 +++
 rust/hw/timer/hpet/src/hpet.rs   |  3 ++-
 rust/qemu-api/src/qom.rs         | 14 +++++++++++---
 rust/qemu-api/tests/tests.rs     |  3 +++
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 7063b60c0cc..a6da9db0bb0 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -160,6 +160,7 @@ impl ObjectImpl for PL011State {
 
     const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
     const INSTANCE_POST_INIT: Option<fn(&Self)> = Some(Self::post_init);
+    const CLASS_INIT: fn(&mut Self::Class) = <Self as ClassInitImpl<Self::Class>>::class_init;
 }
 
 impl DeviceImpl for PL011State {
@@ -744,6 +745,8 @@ unsafe impl ObjectType for PL011Luminary {
 
 impl ObjectImpl for PL011Luminary {
     type ParentType = PL011State;
+
+    const CLASS_INIT: fn(&mut Self::Class) = <Self as ClassInitImpl<Self::Class>>::class_init;
 }
 
 impl DeviceImpl for PL011Luminary {}
diff --git a/rust/hw/timer/hpet/src/hpet.rs b/rust/hw/timer/hpet/src/hpet.rs
index b4ffccf815f..e01b4b67064 100644
--- a/rust/hw/timer/hpet/src/hpet.rs
+++ b/rust/hw/timer/hpet/src/hpet.rs
@@ -21,7 +21,7 @@
     },
     prelude::*,
     qdev::{DeviceImpl, DeviceMethods, DeviceState, Property, ResetType, ResettablePhasesImpl},
-    qom::{ObjectImpl, ObjectType, ParentField},
+    qom::{ClassInitImpl, ObjectImpl, ObjectType, ParentField},
     qom_isa,
     sysbus::{SysBusDevice, SysBusDeviceImpl},
     timer::{Timer, CLOCK_VIRTUAL},
@@ -836,6 +836,7 @@ impl ObjectImpl for HPETState {
 
     const INSTANCE_INIT: Option<unsafe fn(&mut Self)> = Some(Self::init);
     const INSTANCE_POST_INIT: Option<fn(&Self)> = Some(Self::post_init);
+    const CLASS_INIT: fn(&mut Self::Class) = <Self as ClassInitImpl<Self::Class>>::class_init;
 }
 
 // TODO: Make these properties user-configurable!
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 10ce359becb..d821ac25acc 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -180,7 +180,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     T::INSTANCE_POST_INIT.unwrap()(unsafe { state.as_ref() });
 }
 
-unsafe extern "C" fn rust_class_init<T: ObjectType + ClassInitImpl<T::Class>>(
+unsafe extern "C" fn rust_class_init<T: ObjectType + ObjectImpl>(
     klass: *mut ObjectClass,
     _data: *mut c_void,
 ) {
@@ -190,7 +190,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
     // SAFETY: klass is a T::Class, since rust_class_init<T>
     // is called from QOM core as the class_init function
     // for class T
-    T::class_init(unsafe { klass.as_mut() })
+    <T as ObjectImpl>::CLASS_INIT(unsafe { klass.as_mut() })
 }
 
 unsafe extern "C" fn drop_object<T: ObjectImpl>(obj: *mut Object) {
@@ -499,7 +499,7 @@ impl<T: ObjectType> ObjectDeref for &mut T {}
 impl<T: ObjectType> ObjectCastMut for &mut T {}
 
 /// Trait a type must implement to be registered with QEMU.
-pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> + IsA<Object> {
+pub trait ObjectImpl: ObjectType + IsA<Object> {
     /// The parent of the type.  This should match the first field of the
     /// struct that implements `ObjectImpl`, minus the `ParentField<_>` wrapper.
     type ParentType: ObjectType;
@@ -552,6 +552,14 @@ pub trait ObjectImpl: ObjectType + ClassInitImpl<Self::Class> + IsA<Object> {
 
     // methods on ObjectClass
     const UNPARENT: Option<fn(&Self)> = None;
+
+    /// Store into the argument the virtual method implementations
+    /// for `Self`.  On entry, the virtual method pointers are set to
+    /// the default values coming from the parent classes; the function
+    /// can change them to override virtual methods of a parent class.
+    ///
+    /// Usually defined as `<Self as ClassInitImpl<Self::Class>::class_init`.
+    const CLASS_INIT: fn(&mut Self::Class);
 }
 
 /// Internal trait used to automatically fill in a class struct.
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index 03569e4a44c..9546e9d7963 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -60,6 +60,7 @@ unsafe impl ObjectType for DummyState {
 impl ObjectImpl for DummyState {
     type ParentType = DeviceState;
     const ABSTRACT: bool = false;
+    const CLASS_INIT: fn(&mut DummyClass) = <Self as ClassInitImpl<DummyClass>>::class_init;
 }
 
 impl ResettablePhasesImpl for DummyState {}
@@ -102,6 +103,8 @@ unsafe impl ObjectType for DummyChildState {
 impl ObjectImpl for DummyChildState {
     type ParentType = DummyState;
     const ABSTRACT: bool = false;
+    const CLASS_INIT: fn(&mut DummyChildClass) =
+        <Self as ClassInitImpl<DummyChildClass>>::class_init;
 }
 
 impl ResettablePhasesImpl for DummyChildState {}
-- 
2.48.1


