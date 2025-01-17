Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tYsCX-0001VN-US
	for mharc-qemu-rust@gnu.org; Fri, 17 Jan 2025 14:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCV-0001SU-7m
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tYsCT-0002B6-AO
 for qemu-rust@nongnu.org; Fri, 17 Jan 2025 14:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737142812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0ARwjCk/01hXKDGIyxRI2rwcuyqDQN//xQ3CzCZhAQ=;
 b=a7uz7v9rTGyh1jbj+SiMedGopMKIDeBS9rcqgKnlixImdXGGtw1DcH6h+WI0jLwe5xg6ed
 iylL1VydsucainOOgX29tibf5iUHrdPNPXTPIsmn1ApJx3i11GSm8zBRQb0dNpb5xrrgYI
 MXniYC4MMhxNuiDqXFtmo1mpM7UnsiE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496--tSVVDtANceDJRlK4A0_gQ-1; Fri, 17 Jan 2025 14:40:11 -0500
X-MC-Unique: -tSVVDtANceDJRlK4A0_gQ-1
X-Mimecast-MFC-AGG-ID: -tSVVDtANceDJRlK4A0_gQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa634496f58so248001766b.2
 for <qemu-rust@nongnu.org>; Fri, 17 Jan 2025 11:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737142809; x=1737747609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0ARwjCk/01hXKDGIyxRI2rwcuyqDQN//xQ3CzCZhAQ=;
 b=pmWovSpTMidObMm3J5Tx0i1Ux54jjSkUiGFU3Iz0GRL1+MIZf1fN78XktRjtZvoFIc
 JEY0AchgncoJXQXTbqWhD4hK+o9Wy4o0UTDp0w9bvWydpUxsqmY2p2gOHGkFqakfoDsu
 Z0sPy3e2XzqkAGZ8/yJUOLtm/ep+ko9KUk72pc36DBxOYIokgRLKCZOXeZ7r762gg6oW
 UnxskZwZRpgje9Rk4OmHsiw7k7ziAK8nQEVTa2SyK3YG9S7iDefhm2tNIP/4nkhO9r09
 SJRNv5WNRnEQv+a+3kztlJM5zRkjbst0aKfmTYet3qNzovAIUGScoeB1s+qgZZDVtVhk
 wSjQ==
X-Gm-Message-State: AOJu0Yw8qomYtA2RuOeT4BNbuSgs5MgSgMcCsrdRxv27cyIMCuNR0q90
 BZELuF0pYrVq0rvnbUaDo6N17EF/wrwu1R1RWc1o/kAx/ou/BlIIhFv7QZbIoGYm/Vu5kEUVDVZ
 YWaFkbMK+G2RCZN9O7RiDIUSYWZUScWtHtMMIH3gAzQ9nUr3ERzTY9QXOV8Ky8w==
X-Gm-Gg: ASbGncuWlZ0NpZOSqXAo6y4YKU1eS0p5EL5pAaTmuSKs9Wdi/XkXbtJXEhvihumKR4l
 T/BO+5cbGNKo4GlySow5ehJ7A5NOvQ4rM8cOT7gK+I0zFqJD35zH3C395KslZawjUjXzspAn2Gm
 +pMZw1dyG6E5+jtUt1kZieu7vmq1+2jIQgYNaqnCiHMln0+zfDcFN2fqh7SvgG2m8eKRVD0FzwD
 RPwu7Y/HbEAaq7dCn0K3cG7lkpHGI3RVDe+CJU8gtG/FCICHYWp4xCSR56Ejw==
X-Received: by 2002:a17:907:1b15:b0:aae:b259:ef5e with SMTP id
 a640c23a62f3a-ab38aedb10amr439698366b.0.1737142809312; 
 Fri, 17 Jan 2025 11:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMDRdERqU2cfUiTl47s86HjchaelOmwLr6bdW4pbj5I3PpuiERcQKQgI69m80YCaGYdfXq3w==
X-Received: by 2002:a17:907:1b15:b0:aae:b259:ef5e with SMTP id
 a640c23a62f3a-ab38aedb10amr439696366b.0.1737142808843; 
 Fri, 17 Jan 2025 11:40:08 -0800 (PST)
Received: from [192.168.10.47] ([176.206.124.70])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384c61388sm217563366b.20.2025.01.17.11.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 11:40:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 02/10] rust: qom: add reference counting functionality
Date: Fri, 17 Jan 2025 20:39:55 +0100
Message-ID: <20250117194003.1173231-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117194003.1173231-1-pbonzini@redhat.com>
References: <20250117194003.1173231-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sqmLgO3vlxwCSewlihvDIrvdDhqP6fiehcdBoW6ey4A_1737142810
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
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
X-List-Received-Date: Fri, 17 Jan 2025 19:40:15 -0000

Add a smart pointer that allows to add and remove references from
QOM objects.  It's important to note that while all QOM objects have a
reference count, in practice not all of them have their lifetime guarded
by it.  Embedded objects, specifically, are confined to the lifetime of
the owner.

When writing Rust bindings this is important, because embedded objects are
*never* used through the "Owned<>" smart pointer that is introduced here.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qom.rs     | 121 ++++++++++++++++++++++++++++++++++-
 rust/qemu-api/src/vmstate.rs |   6 +-
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 97901fb9084..c404f8a1aa7 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -56,13 +56,21 @@
 use std::{
     ffi::CStr,
     fmt,
+    mem::ManuallyDrop,
     ops::{Deref, DerefMut},
     os::raw::c_void,
+    ptr::NonNull,
 };
 
 pub use bindings::{Object, ObjectClass};
 
-use crate::bindings::{self, object_dynamic_cast, object_get_class, object_get_typename, TypeInfo};
+use crate::{
+    bindings::{
+        self, object_dynamic_cast, object_get_class, object_get_typename, object_ref, object_unref,
+        TypeInfo,
+    },
+    cell::bql_locked,
+};
 
 /// Marker trait: `Self` can be statically upcasted to `P` (i.e. `P` is a direct
 /// or indirect parent of `Self`).
@@ -605,6 +613,110 @@ unsafe impl ObjectType for Object {
         unsafe { CStr::from_bytes_with_nul_unchecked(bindings::TYPE_OBJECT) };
 }
 
+/// A reference-counted pointer to a QOM object.
+///
+/// `Owned<T>` wraps `T` with automatic reference counting.  It increases the
+/// reference count when created via [`Owned::from`] and decreases it when
+/// dropped. This ensures that the reference count remains elevated as long as
+/// any `Owned<T>` references to it exist. Note that however the object may
+/// disappear if it is *embedded* within a larger object. For more information
+/// see the [`Owned::from`].
+///
+/// It is *not* safe to send `Owned<T>` to another thread, because currently
+/// `object_unref` requires the Big QEMU Lock.
+#[repr(transparent)]
+#[derive(PartialEq, Eq, Hash, PartialOrd, Ord)]
+pub struct Owned<T: ObjectType>(NonNull<T>);
+
+// SAFETY: the implementation asserts via `bql_locked` that the BQL is taken
+unsafe impl<T: ObjectType + Sync> Sync for Owned<T> {}
+
+impl<T: ObjectType> Owned<T> {
+    /// Convert a raw C pointer into an owned reference to the QOM
+    /// object it points to.  The object's reference count will be
+    /// decreased when the `Owned` is dropped.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `ptr` is NULL.
+    ///
+    /// # Safety
+    ///
+    /// The caller must indeed own a reference to the QOM object.
+    /// The object must not be embedded in another unless the outer
+    /// object is guaranteed to have a longer lifetime.
+    ///
+    /// A raw pointer obtained via [`Owned::into_raw()`] can always be passed
+    /// back to `from_raw()` (assuming the original `Owned` was valid!),
+    /// since the owned reference remains there between the calls to
+    /// `into_raw()` and `from_raw()`.
+    #[allow(clippy::missing_const_for_fn)]
+    pub unsafe fn from_raw(ptr: *const T) -> Self {
+        // SAFETY NOTE: while NonNull requires a mutable pointer, only
+        // Deref is implemented so the pointer passed to from_raw
+        // remains const
+        Owned(NonNull::new(ptr as *mut T).unwrap())
+    }
+
+    /// Obtain a raw C pointer from a reference.  `src` is consumed
+    /// and the reference is leaked.
+    #[allow(clippy::missing_const_for_fn)]
+    pub fn into_raw(src: Owned<T>) -> *mut T {
+        let src = ManuallyDrop::new(src);
+        src.0.as_ptr()
+    }
+
+    /// Increase the reference count of a QOM object and return
+    /// a new owned reference to it.
+    ///
+    /// # Safety
+    ///
+    /// The object must not be embedded in another, unless the outer
+    /// object is guaranteed to have a longer lifetime.
+    pub unsafe fn from(obj: &T) -> Self {
+        unsafe {
+            object_ref(obj.as_object_mut_ptr().cast::<c_void>());
+
+            // SAFETY NOTE: while NonNull requires a mutable pointer, only
+            // Deref is implemented so the reference passed to from_raw
+            // remains shared
+            Owned(NonNull::new_unchecked(obj.as_mut_ptr()))
+        }
+    }
+}
+
+impl<T: ObjectType> Deref for Owned<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: creation method is unsafe; whoever calls it has
+        // responsibility that the pointer is valid, and remains valid
+        // throughout the lifetime of the `Owned<T>`.
+        // With that guarantee, reference counting ensures that
+        // the object remains alive.
+        unsafe { &*self.0.as_ptr() }
+    }
+}
+impl<T: ObjectType> ObjectDeref for Owned<T> {}
+
+impl<T: ObjectType> Drop for Owned<T> {
+    fn drop(&mut self) {
+        assert!(bql_locked());
+        // SAFETY: creation method is unsafe, and whoever calls it has
+        // responsibility that the pointer is valid, and remains valid
+        // throughout the lifetime of the `Owned<T>`.
+        unsafe {
+            object_unref(self.as_object_mut_ptr().cast::<c_void>());
+        }
+    }
+}
+
+impl<T: IsA<Object>> fmt::Debug for Owned<T> {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        self.deref().debug_fmt(f)
+    }
+}
+
 /// Trait for methods exposed by the Object class.  The methods can be
 /// called on all objects that have the trait `IsA<Object>`.
 ///
@@ -636,6 +748,13 @@ fn get_class(&self) -> &'static <Self::Target as ObjectType>::Class {
 
         klass
     }
+
+    /// Convenience function for implementing the Debug trait
+    fn debug_fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        f.debug_tuple(&self.typename())
+            .field(&(self as *const Self))
+            .finish()
+    }
 }
 
 impl<R: ObjectDeref> ObjectMethods for R where R::Target: IsA<Object> {}
diff --git a/rust/qemu-api/src/vmstate.rs b/rust/qemu-api/src/vmstate.rs
index 6ac432cf52f..11d21b8791c 100644
--- a/rust/qemu-api/src/vmstate.rs
+++ b/rust/qemu-api/src/vmstate.rs
@@ -29,6 +29,8 @@
 pub use crate::bindings::{VMStateDescription, VMStateField};
 use crate::{
     bindings::{self, VMStateFlags},
+    prelude::*,
+    qom::Owned,
     zeroable::Zeroable,
 };
 
@@ -191,7 +193,8 @@ pub const fn vmstate_varray_flag<T: VMState>(_: PhantomData<T>) -> VMStateFlags
 /// * a transparent wrapper for any of the above (`Cell`, `UnsafeCell`,
 ///   [`BqlCell`](crate::cell::BqlCell), [`BqlRefCell`](crate::cell::BqlRefCell)
 /// * a raw pointer to any of the above
-/// * a `NonNull` pointer or a `Box` for any of the above
+/// * a `NonNull` pointer, a `Box` or an [`Owned`](crate::qom::Owned) for any of
+///   the above
 /// * an array of any of the above
 ///
 /// In order to support other types, the trait `VMState` must be implemented
@@ -398,6 +401,7 @@ unsafe impl<$base> VMState for $type where $base: VMState $($where)* {
 // Unlike C pointers, Box is always non-null therefore there is no need
 // to specify VMS_ALLOC.
 impl_vmstate_pointer!(Box<T> where T: VMState);
+impl_vmstate_pointer!(Owned<T> where T: VMState + ObjectType);
 
 // Arrays using the underlying type's VMState plus
 // VMS_ARRAY/VMS_ARRAY_OF_POINTER
-- 
2.47.1


