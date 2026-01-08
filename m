Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F293FD185EF
	for <qemu-rust@archiver.kernel.org>; Thu,  8 Jan 2026 13:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vdpmz-0007VM-Hd; Thu, 08 Jan 2026 08:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpmx-0007Ud-9W
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vdpmu-0007xC-KL
 for qemu-rust@nongnu.org; Thu, 08 Jan 2026 08:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767877851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+ou4jVNnFiCxKe4bwC9g/4o2bH3WOIu5RMilZ8uR2g=;
 b=N2mnvdCBpuDYCN2p4m7ZnslZHgsV0xiEHOalkzzOKAHc22Gyouu+P/tXs/TsVUjqyuSWg8
 OF69s7sqxswXH8Mz/Avu+TzXtW7Ku37hl7dPcbiVMac2J0KlSJV5QoYF/ePJ0bz3kU5sbU
 8BVxkntCrgD7E2Sb/Lg1roKt/pl+5RM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-X3KPfL9cPFO4jwVTnnyFqw-1; Thu, 08 Jan 2026 08:10:50 -0500
X-MC-Unique: X3KPfL9cPFO4jwVTnnyFqw-1
X-Mimecast-MFC-AGG-ID: X3KPfL9cPFO4jwVTnnyFqw_1767877849
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430fe16b481so1698282f8f.3
 for <qemu-rust@nongnu.org>; Thu, 08 Jan 2026 05:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767877849; x=1768482649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1+ou4jVNnFiCxKe4bwC9g/4o2bH3WOIu5RMilZ8uR2g=;
 b=OIC5e/K5XQBWDKUOI53m/F8dhtfh4nxQM2gOUvf9satZ6jjgN5i1mtws0RVxa59BqL
 drXJ2SEdQwXH+7rA3iRK305UHxz/PO9Or1ZQaBIw59lUMTfe4Cir9kcg3n1jzt674D01
 I4S+E4HKSsG2B5dt9j/e/knsMAR5NyBwIouoJ6kXAij2IEvmGdTVXIZr83+hGyTTD5u1
 vrF1jEkc77k9bUYfkhCFYjFqjX2++juCYN0a4DHe9BuvssCiZgNQhYhXUGCI+PVUxYQl
 AQFdpQ1AmokD4NYyn4XCANtMm4/GCLO0uGri3yFXajhPI28cnDKyBjWus9lfEy1+Or3s
 U3fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfjGn0t8P5eVGLUPZoi8gutZZjgoX4gWcQ0ueYc2qrWw4XU0NHmz+2iZBmd0FND/hsBU45lwhmDkw=@nongnu.org
X-Gm-Message-State: AOJu0YzKwe0ZliYQxsyfgwD9Z71Z86fDPn52oL13Jplf3NOC9n3P+R/0
 cQDtAjiko2l60GfW4PKJEctPHsN8+bgbzAXwqS/JVPEjnt61Myf9SLIqvU3QjZLWhb1QaWS7FX2
 Q/Vsg78ZZt3mz7UA6ZczKLqSXTWAlRqSTiL23XPDHt8R3lfgaDcOg6Sw=
X-Gm-Gg: AY/fxX77kTSuzLrhx8dOn7YlGMJYh/Vbh+/ecYutM9IyVupEvxRVfWs2LNR7EmxEsV8
 fks6rcu3plgDNmfT0QUzk9C+e+/VNjO3Umb1scUppEWRvFQM0hHeZ6TIs1tVQuZAqrwWfQVvNOO
 HGCs8hYQLAZwjb9LQR4DZJB243pLktPxYv9pF+F0nxnz1Wqa6pc1Nz/X7tgDpcTofwL1KsefS15
 icBwUzrO0D8pI6MJG/atXrayhShWgZivgzykCdNqjVYblwY2dPgZGdYi3UhP+l0xuLGh1200mQ7
 mSMzUI1GJB3nHT0olhgXqgSRLFb72lz4hQHbWYEKXbi30/c3Y3dWy3tWNqql/oZr8e7IJ2epRdW
 xqAkTje+qmrhyLwXS3jde5uw+z5Vtp6DjiqI5czN/soeGhom2K+wBCo/Nl11yB1NEyoRoe9O8Kj
 gp1VxsXo5NKPzPDA==
X-Received: by 2002:a05:6000:40cd:b0:432:84ee:186f with SMTP id
 ffacd0b85a97d-432c379dc44mr8044179f8f.33.1767877848960; 
 Thu, 08 Jan 2026 05:10:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIKLIBrcrivLwbcqPHqxVQPEABek1scIeDMkQkNnrrDtJlYUm+q55Sr568msCqY6JugMjzXA==
X-Received: by 2002:a05:6000:40cd:b0:432:84ee:186f with SMTP id
 ffacd0b85a97d-432c379dc44mr8044143f8f.33.1767877848448; 
 Thu, 08 Jan 2026 05:10:48 -0800 (PST)
Received: from [192.168.10.48] ([151.61.26.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ede7esm16232759f8f.32.2026.01.08.05.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:10:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-rust@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 01/16] rust/qobject: add basic bindings
Date: Thu,  8 Jan 2026 14:10:28 +0100
Message-ID: <20260108131043.490084-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108131043.490084-1-pbonzini@redhat.com>
References: <20260108131043.490084-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ODkpgUCju4nfTHwCpn0vmmEZSOrDyzibTVP7L3p8GRo_1767877849
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is only a basic API, intended to be used by the serde traits.

Co-authored-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qobject/qobject.h    |   5 +-
 rust/util/wrapper.h          |   7 +
 rust/util/meson.build        |   6 +-
 rust/util/src/lib.rs         |   4 +
 rust/util/src/qobject/mod.rs | 331 +++++++++++++++++++++++++++++++++++
 5 files changed, 350 insertions(+), 3 deletions(-)
 create mode 100644 rust/util/src/qobject/mod.rs

diff --git a/include/qobject/qobject.h b/include/qobject/qobject.h
index 02f4c6a6eb2..567da7b6c51 100644
--- a/include/qobject/qobject.h
+++ b/include/qobject/qobject.h
@@ -35,7 +35,10 @@
 #include "qemu/atomic.h"
 #include "qapi/qapi-builtin-types.h"
 
-/* Not for use outside include/qobject/ */
+/*
+ * Not for use outside include/qobject/ (and Rust bindings, when they
+ * have to redo inline functions here).
+ */
 struct QObjectBase_ {
     QType type;
     size_t refcnt;
diff --git a/rust/util/wrapper.h b/rust/util/wrapper.h
index b9ed68a01d8..0907dd59142 100644
--- a/rust/util/wrapper.h
+++ b/rust/util/wrapper.h
@@ -30,3 +30,10 @@ typedef enum memory_order {
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qobject/qnull.h"
+#include "qobject/qbool.h"
+#include "qobject/qnum.h"
+#include "qobject/qstring.h"
+#include "qobject/qobject.h"
+#include "qobject/qlist.h"
+#include "qobject/qdict.h"
diff --git a/rust/util/meson.build b/rust/util/meson.build
index 98629394afb..28593286134 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -37,8 +37,10 @@ _util_rs = static_library(
       'src/prelude.rs',
       'src/timer.rs',
     ],
-    {'.': _util_bindings_inc_rs}
-  ),
+    {'.': _util_bindings_inc_rs,
+    'qobject': [
+      'src/qobject/mod.rs',
+    ]}),
   dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs],
 )
 
diff --git a/rust/util/src/lib.rs b/rust/util/src/lib.rs
index 7d2de3ed811..96334466895 100644
--- a/rust/util/src/lib.rs
+++ b/rust/util/src/lib.rs
@@ -9,6 +9,10 @@
 // for prelude-like modules
 #[rustfmt::skip]
 pub mod prelude;
+
+#[macro_use]
+pub mod qobject;
+
 pub mod timer;
 
 pub use error::{Error, Result, ResultExt};
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
new file mode 100644
index 00000000000..5744870ad1c
--- /dev/null
+++ b/rust/util/src/qobject/mod.rs
@@ -0,0 +1,331 @@
+//! `QObject` bindings
+//!
+//! This module implements bindings for QEMU's `QObject` data structure.
+//! The bindings integrate with `serde`, which take the role of visitors
+//! in Rust code.
+
+#![deny(clippy::unwrap_used)]
+
+use std::{
+    cell::UnsafeCell,
+    ffi::{c_char, CString},
+    mem::ManuallyDrop,
+    ptr::{addr_of, addr_of_mut},
+    sync::atomic::{AtomicUsize, Ordering},
+};
+
+use common::assert_field_type;
+
+use crate::bindings;
+
+/// A wrapper for a C `QObject`.
+///
+/// Because `QObject` is not thread-safe, the safety of these bindings
+/// right now hinges on treating them as immutable.  It is part of the
+/// contract with the `QObject` constructors that the Rust struct is
+/// only built after the contents are stable.
+///
+/// Only a bare bones API is public; production and consumption of `QObject`
+/// generally goes through `serde`.
+pub struct QObject(&'static UnsafeCell<bindings::QObject>);
+
+// SAFETY: the QObject API are not thread-safe other than reference counting;
+// but the Rust struct is only created once the contents are stable, and
+// therefore it obeys the aliased XOR mutable invariant.
+unsafe impl Send for QObject {}
+unsafe impl Sync for QObject {}
+
+// Since a QObject can be a floating-point value, and potentially a NaN,
+// do not implement Eq
+impl PartialEq for QObject {
+    fn eq(&self, other: &Self) -> bool {
+        unsafe { bindings::qobject_is_equal(self.0.get(), other.0.get()) }
+    }
+}
+
+impl QObject {
+    /// Construct a [`QObject`] from a C `QObjectBase` pointer.
+    /// The caller cedes its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObjectBase` must not be changed from C code while
+    /// the Rust `QObject` lives
+    const unsafe fn from_base(p: *const bindings::QObjectBase_) -> Self {
+        QObject(unsafe { &*p.cast() })
+    }
+
+    /// Construct a [`QObject`] from a C `QObject` pointer.
+    /// The caller cedes its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObject` must not be changed from C code while
+    /// the Rust `QObject` lives
+    pub const unsafe fn from_raw(p: *const bindings::QObject) -> Self {
+        QObject(unsafe { &*p.cast() })
+    }
+
+    /// Obtain a raw C pointer from a reference. `self` is consumed
+    /// without decreasing the reference count; therefore, the reference
+    /// is transferred to the `*mut bindings::QObject`.
+    pub fn into_raw(self) -> *mut bindings::QObject {
+        let src = ManuallyDrop::new(self);
+        src.0.get()
+    }
+
+    /// Construct a [`QObject`] from a C `QObjectBase` pointer.
+    /// The caller *does not* cede its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObjectBase` must not be changed from C code while
+    /// the Rust `QObject` lives
+    unsafe fn cloned_from_base(p: *const bindings::QObjectBase_) -> Self {
+        let orig = unsafe { ManuallyDrop::new(QObject::from_base(p)) };
+        (*orig).clone()
+    }
+
+    /// Construct a [`QObject`] from a C `QObject` pointer.
+    /// The caller *does not* cede its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObject` must not be changed from C code while
+    /// the Rust `QObject` lives
+    pub unsafe fn cloned_from_raw(p: *const bindings::QObject) -> Self {
+        let orig = unsafe { ManuallyDrop::new(QObject::from_raw(p)) };
+        (*orig).clone()
+    }
+
+    fn refcnt(&self) -> &AtomicUsize {
+        assert_field_type!(bindings::QObjectBase_, refcnt, usize);
+        let qobj = self.0.get();
+        unsafe { AtomicUsize::from_ptr(addr_of_mut!((*qobj).base.refcnt)) }
+    }
+}
+
+/// Rust equivalent of the C `QOBJECT` macro; for internal use only, because
+/// all access should go through `From` (which already returns [`QObject`]
+/// or serde.
+macro_rules! qobject {
+    ($qobj:expr) => {{
+        let qobj: &bindings::QObjectBase_ = &$qobj.base;
+        // SAFETY: this `let` guarantees that either $qobj is a reference
+        // (not a raw pointer), or we're in an outer unsafe block
+        unsafe { QObject::from_base(qobj) }
+    }};
+}
+
+impl From<()> for QObject {
+    fn from(_null: ()) -> Self {
+        // Conversion of the C inline `qnull` function
+        unsafe { QObject::cloned_from_base(addr_of!(bindings::qnull_.base)) }
+    }
+}
+
+impl<T> From<Option<T>> for QObject
+where
+    QObject: From<T>,
+{
+    fn from(o: Option<T>) -> Self {
+        o.map_or_else(|| ().into(), Into::into)
+    }
+}
+
+impl From<bool> for QObject {
+    fn from(b: bool) -> Self {
+        let qobj = unsafe { &*bindings::qbool_from_bool(b) };
+        qobject!(qobj)
+    }
+}
+
+macro_rules! impl_from_return_qnum_int {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_int(n.into()) };
+                qobject!(qobj)
+            }
+        }
+    };
+}
+
+impl_from_return_qnum_int!(i8);
+impl_from_return_qnum_int!(i16);
+impl_from_return_qnum_int!(i32);
+impl_from_return_qnum_int!(i64);
+
+macro_rules! impl_from_return_qnum_uint {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_uint(n.into()) };
+                qobject!(qobj)
+            }
+        }
+    };
+}
+
+impl_from_return_qnum_uint!(u8);
+impl_from_return_qnum_uint!(u16);
+impl_from_return_qnum_uint!(u32);
+impl_from_return_qnum_uint!(u64);
+
+macro_rules! impl_from_return_qnum_double {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_double(n.into()) };
+                qobject!(qobj)
+            }
+        }
+    };
+}
+
+impl_from_return_qnum_double!(f32);
+impl_from_return_qnum_double!(f64);
+
+impl From<CString> for QObject {
+    fn from(s: CString) -> Self {
+        let qobj = unsafe { &*bindings::qstring_from_str(s.as_ptr()) };
+        qobject!(qobj)
+    }
+}
+
+impl<A> FromIterator<A> for QObject
+where
+    Self: From<A>,
+{
+    fn from_iter<I: IntoIterator<Item = A>>(it: I) -> Self {
+        let qlist = unsafe { &mut *bindings::qlist_new() };
+        for elem in it {
+            let elem: QObject = elem.into();
+            let elem = elem.into_raw();
+            unsafe {
+                bindings::qlist_append_obj(qlist, elem);
+            }
+        }
+        qobject!(qlist)
+    }
+}
+
+impl<A> FromIterator<(CString, A)> for QObject
+where
+    Self: From<A>,
+{
+    fn from_iter<I: IntoIterator<Item = (CString, A)>>(it: I) -> Self {
+        let qdict = unsafe { &mut *bindings::qdict_new() };
+        for (key, val) in it {
+            let val: QObject = val.into();
+            let val = val.into_raw();
+            unsafe {
+                bindings::qdict_put_obj(qdict, key.as_ptr().cast::<c_char>(), val);
+            }
+        }
+        qobject!(qdict)
+    }
+}
+
+impl Clone for QObject {
+    fn clone(&self) -> Self {
+        self.refcnt().fetch_add(1, Ordering::Acquire);
+        QObject(self.0)
+    }
+}
+
+impl Drop for QObject {
+    fn drop(&mut self) {
+        if self.refcnt().fetch_sub(1, Ordering::Release) == 1 {
+            unsafe {
+                bindings::qobject_destroy(self.0.get());
+            }
+        }
+    }
+}
+
+#[allow(unused)]
+macro_rules! match_qobject {
+    (@internal ($qobj:expr) =>
+        $(() => $unit:expr,)?
+        $(bool($boolvar:tt) => $bool:expr,)?
+        $(i64($i64var:tt) => $i64:expr,)?
+        $(u64($u64var:tt) => $u64:expr,)?
+        $(f64($f64var:tt) => $f64:expr,)?
+        $(CStr($cstrvar:tt) => $cstr:expr,)?
+        $(QList($qlistvar:tt) => $qlist:expr,)?
+        $(QDict($qdictvar:tt) => $qdict:expr,)?
+        $(_ => $other:expr,)?
+    ) => {
+        loop {
+            let qobj_ = $qobj.0.get();
+            match unsafe { &* qobj_ }.base.type_ {
+                $($crate::bindings::QTYPE_QNULL => break $unit,)?
+                $($crate::bindings::QTYPE_QBOOL => break {
+                    let qbool__: *mut $crate::bindings::QBool = qobj_.cast();
+                    let $boolvar = unsafe { (&*qbool__).value };
+                    $bool
+                },)?
+                $crate::bindings::QTYPE_QNUM => {
+                    let qnum__: *mut $crate::bindings::QNum = qobj_.cast();
+                    let qnum__ = unsafe { &*qnum__ };
+                    match qnum__.kind {
+                        $crate::bindings::QNUM_I64 |
+                        $crate::bindings::QNUM_U64 |
+                        $crate::bindings::QNUM_DOUBLE => {}
+                        _ => {
+                            panic!("unreachable");
+                        }
+                    }
+
+                    match qnum__.kind {
+                        $($crate::bindings::QNUM_I64 => break {
+                            let $i64var = unsafe { qnum__.u.i64_ };
+                            $i64
+                        },)?
+                        $($crate::bindings::QNUM_U64 => break {
+                            let $u64var = unsafe { qnum__.u.u64_ };
+                            $u64
+                        },)?
+                        $($crate::bindings::QNUM_DOUBLE => break {
+                            let $f64var = unsafe { qnum__.u.dbl };
+                            $f64
+                        },)?
+                        _ => {} // evaluate $other
+                    }
+                },
+                $($crate::bindings::QTYPE_QSTRING => break {
+                    let qstring__: *mut $crate::bindings::QString = qobj_.cast();
+                    let $cstrvar = unsafe { ::core::ffi::CStr::from_ptr((&*qstring__).string) };
+                    $cstr
+                },)?
+                $($crate::bindings::QTYPE_QLIST => break {
+                    let qlist__: *mut $crate::bindings::QList = qobj_.cast();
+                    let $qlistvar = unsafe { &*qlist__ };
+                    $qlist
+                },)?
+                $($crate::bindings::QTYPE_QDICT => break {
+                    let qdict__: *mut $crate::bindings::QDict = qobj_.cast();
+                    let $qdictvar = unsafe { &*qdict__ };
+                    $qdict
+                },)?
+                _ => ()
+            };
+            $(break $other;)?
+            #[allow(unreachable_code)]
+            {
+                panic!("unreachable");
+            }
+        }
+    };
+
+    // first cleanup the syntax a bit, checking that there's at least
+    // one pattern and always adding a trailing comma
+    (($qobj:expr) =>
+        $($type:tt$(($val:tt))? => $code:expr ),+ $(,)?) => {
+            match_qobject!(@internal ($qobj) =>
+                $($type $(($val))? => $code,)+)
+    };
+}
+#[allow(unused_imports)]
+use match_qobject;
-- 
2.52.0


