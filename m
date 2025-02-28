Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnwD2-0003GN-Sx
	for mharc-qemu-rust@gnu.org; Fri, 28 Feb 2025 03:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnwCf-00037j-22
 for qemu-rust@nongnu.org; Fri, 28 Feb 2025 03:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tnwCd-0005s5-1k
 for qemu-rust@nongnu.org; Fri, 28 Feb 2025 03:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740733117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2jkKGcN6bygOr7E4uR5Cr93BfLH/8qt9r/Eb92qp9hE=;
 b=N8nJ8MT/thoy/XNMKrJwzKHA4+S5WAaJHVvGz5qgm2G+JmUczD1BPl6/rGssK/ETa750jl
 VTwR4npKswX8Ic9YiCDCWO68VNqGfT3Cd4rCKZZb2ek0oJatXRFR/2n9bUsuP6G/IH0GKB
 j0+wV8AJOh/vODtPxf92mPmdmDsFL/8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Iinm9SDRPrybPqOoUMQjOQ-1; Fri, 28 Feb 2025 03:58:35 -0500
X-MC-Unique: Iinm9SDRPrybPqOoUMQjOQ-1
X-Mimecast-MFC-AGG-ID: Iinm9SDRPrybPqOoUMQjOQ_1740733114
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4394c747c72so7850115e9.1
 for <qemu-rust@nongnu.org>; Fri, 28 Feb 2025 00:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740733114; x=1741337914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jkKGcN6bygOr7E4uR5Cr93BfLH/8qt9r/Eb92qp9hE=;
 b=xBUucTBdN/jaDlv93V00khwvFz4AEiF+9oEk1A3UCsUOqGqf2jsqzohFlNN+9dLI5P
 s0qMyYrz0lIKqUkx/u3FuFMC50S7DI9hpis8fe7Xvea8ceJZoPf1rT9JgNwJQPS9N1iA
 VhyvmdMOtyl0YGbJeHdl/wtoSbfxaLSkBMHy/jgJo64GF/BdV4XwLTQxp00mfVk57hQa
 1aasP5gGXG1ZrPq8boeUT2a07h9716uidiFNfoqRIKNrd4wYSHS3iOQl9FRu6RmqLN3q
 aHNT5DwyO6R3BVgNlQXmVSo6P5zjoP5z7YHIlz4zgcAz2BizBhOXy14drhckdFMt6pfw
 GrRQ==
X-Gm-Message-State: AOJu0YyG9TU6A1qBK9ldWSpwLFjaZWFC54Peo7uOxL71TNuzRt6PubrL
 bTdGFMZxsY4OE3HUYlvk3N+N+TjS2dmmMRTCSU29jXFROSXjH6nbppkXC1ERrqxfzd0glGaUY8U
 n1v5egyq8t2DODmHsSMoVRwFzL8oaWxDBGFa8OpGaPX23/UXf0LSMPmgT20dHkQ==
X-Gm-Gg: ASbGncsYOwONZT/gtqz+l2H+d6g5jov0MMraLZkpETn2NAVHXrxrGhmvhinlUWdNKn8
 jZgxDqqyZYbN7Dg0nnyhPNt2LS6m5w6xgieClgsgyJgNTswQTuBTSR++dLTYvrwgirif+rlMxvm
 rkgPcfRJVs2ygt3426Bc8POFTfwsV5viOiHvoFKOs4LIk9NbcSEQVZNUpB+igXHlU1/sDAWIvVc
 1L+GaZ1rLXQidukX0+X6u6/dZzFOA+XYh8PsmaTw1zrtXbMS3fsFZ0kMsrM/yjvGnGjnWf4tARi
 2GjvsYRfPDMED0iVqwgv
X-Received: by 2002:a05:600c:35c3:b0:439:9377:fa17 with SMTP id
 5b1f17b1804b1-43ba67085e7mr18689045e9.18.1740733113656; 
 Fri, 28 Feb 2025 00:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqoqtxp0Us3EKgYnQ/EzqFPvcJxQO8hGO+/16eSd5VaVx8GWFnlK5LruJLLnxm5XoBnluJew==
X-Received: by 2002:a05:600c:35c3:b0:439:9377:fa17 with SMTP id
 5b1f17b1804b1-43ba67085e7mr18688775e9.18.1740733113186; 
 Fri, 28 Feb 2025 00:58:33 -0800 (PST)
Received: from [192.168.10.48] ([151.95.152.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a28b75esm48335885e9.34.2025.02.28.00.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 00:58:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH] rust: qom: remove operations on &mut
Date: Fri, 28 Feb 2025 09:58:31 +0100
Message-ID: <20250228085831.847265-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SRRIdG6dFnS5cBMKoEgqj0tCP1EHNAjaagVrPeE93cA_1740733114
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 28 Feb 2025 08:58:49 -0000

The dubious casts of mutable references to objects are not used
anymore: the wrappers for qdev_init_clock_in and for IRQ and MMIO
initialization can be called directly on the subclasses, without
casts, plus they take a shared reference so they can just use
"upcast()" instead of "upcast_mut()".  Remove them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/prelude.rs |  1 -
 rust/qemu-api/src/qom.rs     | 83 ------------------------------------
 rust/qemu-api/tests/tests.rs | 34 +--------------
 3 files changed, 2 insertions(+), 116 deletions(-)

diff --git a/rust/qemu-api/src/prelude.rs b/rust/qemu-api/src/prelude.rs
index 634acf37a85..43bfcd5fcab 100644
--- a/rust/qemu-api/src/prelude.rs
+++ b/rust/qemu-api/src/prelude.rs
@@ -17,7 +17,6 @@
 pub use crate::qom::IsA;
 pub use crate::qom::Object;
 pub use crate::qom::ObjectCast;
-pub use crate::qom::ObjectCastMut;
 pub use crate::qom::ObjectDeref;
 pub use crate::qom::ObjectClassMethods;
 pub use crate::qom::ObjectMethods;
diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 2defbd23516..34d7bc0ef96 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -463,90 +463,7 @@ unsafe fn unsafe_cast<'a, U: ObjectType>(self) -> &'a U
 impl<T: ObjectType> ObjectDeref for &T {}
 impl<T: ObjectType> ObjectCast for &T {}
 
-/// Trait for mutable type casting operations in the QOM hierarchy.
-///
-/// This trait provides the mutable counterparts to [`ObjectCast`]'s conversion
-/// functions. Unlike `ObjectCast`, this trait returns `Result` for fallible
-/// conversions to preserve the original smart pointer if the cast fails. This
-/// is necessary because mutable references cannot be copied, so a failed cast
-/// must return ownership of the original reference. For example:
-///
-/// ```ignore
-/// let mut dev = get_device();
-/// // If this fails, we need the original `dev` back to try something else
-/// match dev.dynamic_cast_mut::<FooDevice>() {
-///    Ok(foodev) => /* use foodev */,
-///    Err(dev) => /* still have ownership of dev */
-/// }
-/// ```
-pub trait ObjectCastMut: Sized + ObjectDeref + DerefMut
-where
-    Self::Target: ObjectType,
-{
-    /// Safely convert from a derived type to one of its parent types.
-    ///
-    /// This is always safe; the [`IsA`] trait provides static verification
-    /// that `Self` dereferences to `U` or a child of `U`.
-    fn upcast_mut<'a, U: ObjectType>(self) -> &'a mut U
-    where
-        Self::Target: IsA<U>,
-        Self: 'a,
-    {
-        // SAFETY: soundness is declared via IsA<U>, which is an unsafe trait
-        unsafe { self.unsafe_cast_mut::<U>() }
-    }
-
-    /// Attempt to convert to a derived type.
-    ///
-    /// Returns `Ok(..)` if the object is of type `U`, or `Err(self)` if the
-    /// object if the conversion failed. This is verified at runtime by
-    /// checking the object's type information.
-    fn downcast_mut<'a, U: IsA<Self::Target>>(self) -> Result<&'a mut U, Self>
-    where
-        Self: 'a,
-    {
-        self.dynamic_cast_mut::<U>()
-    }
-
-    /// Attempt to convert between any two types in the QOM hierarchy.
-    ///
-    /// Returns `Ok(..)` if the object is of type `U`, or `Err(self)` if the
-    /// object if the conversion failed. This is verified at runtime by
-    /// checking the object's type information.
-    fn dynamic_cast_mut<'a, U: ObjectType>(self) -> Result<&'a mut U, Self>
-    where
-        Self: 'a,
-    {
-        unsafe {
-            // SAFETY: upcasting to Object is always valid, and the
-            // return type is either NULL or the argument itself
-            let result: *mut U =
-                object_dynamic_cast(self.as_object_mut_ptr(), U::TYPE_NAME.as_ptr()).cast();
-
-            result.as_mut().ok_or(self)
-        }
-    }
-
-    /// Convert to any QOM type without verification.
-    ///
-    /// # Safety
-    ///
-    /// What safety? You need to know yourself that the cast is correct; only
-    /// use when performance is paramount.  It is still better than a raw
-    /// pointer `cast()`, which does not even check that you remain in the
-    /// realm of QOM `ObjectType`s.
-    ///
-    /// `unsafe_cast::<Object>()` is always safe.
-    unsafe fn unsafe_cast_mut<'a, U: ObjectType>(self) -> &'a mut U
-    where
-        Self: 'a,
-    {
-        unsafe { &mut *self.as_mut_ptr::<Self::Target>().cast::<U>() }
-    }
-}
-
 impl<T: ObjectType> ObjectDeref for &mut T {}
-impl<T: ObjectType> ObjectCastMut for &mut T {}
 
 /// Trait a type must implement to be registered with QEMU.
 pub trait ObjectImpl: ObjectType + IsA<Object> {
diff --git a/rust/qemu-api/tests/tests.rs b/rust/qemu-api/tests/tests.rs
index e3985782a38..269122e7ec1 100644
--- a/rust/qemu-api/tests/tests.rs
+++ b/rust/qemu-api/tests/tests.rs
@@ -2,13 +2,10 @@
 // Author(s): Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-use std::{
-    ffi::{c_void, CStr},
-    ptr::{addr_of, addr_of_mut},
-};
+use std::{ffi::CStr, ptr::addr_of};
 
 use qemu_api::{
-    bindings::{module_call_init, module_init_type, object_new, object_unref, qdev_prop_bool},
+    bindings::{module_call_init, module_init_type, qdev_prop_bool},
     c_str,
     cell::{self, BqlCell},
     declare_properties, define_property,
@@ -182,30 +179,3 @@ fn test_cast() {
         assert_eq!(addr_of!(*sbd_ref), p_ptr.cast());
     }
 }
-
-#[test]
-#[allow(clippy::shadow_unrelated)]
-/// Test casts on mutable references.
-fn test_cast_mut() {
-    init_qom();
-    let p: *mut DummyState = unsafe { object_new(DummyState::TYPE_NAME.as_ptr()).cast() };
-
-    let p_ref: &mut DummyState = unsafe { &mut *p };
-    let obj_ref: &mut Object = p_ref.upcast_mut();
-    assert_eq!(addr_of_mut!(*obj_ref), p.cast());
-
-    let sbd_ref: Result<&mut SysBusDevice, &mut Object> = obj_ref.dynamic_cast_mut();
-    let obj_ref = sbd_ref.unwrap_err();
-
-    let dev_ref: Result<&mut DeviceState, &mut Object> = obj_ref.downcast_mut();
-    let dev_ref = dev_ref.unwrap();
-    assert_eq!(addr_of_mut!(*dev_ref), p.cast());
-
-    // SAFETY: the cast is wrong, but the value is only used for comparison
-    unsafe {
-        let sbd_ref: &mut SysBusDevice = obj_ref.unsafe_cast_mut();
-        assert_eq!(addr_of_mut!(*sbd_ref), p.cast());
-
-        object_unref(p_ref.as_object_mut_ptr().cast::<c_void>());
-    }
-}
-- 
2.48.1


