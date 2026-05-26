Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ABFCD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 17:56:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRw13-0001uU-HP; Tue, 26 May 2026 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw11-0001t8-VT
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wRw0x-0007rD-Ep
 for qemu-rust@nongnu.org; Tue, 26 May 2026 13:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779818185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAcLiKCSXLRb9arAXRZkzh+D3RnWx3VHk4itjUtPIUY=;
 b=dg8u5Mq5dKC83d6NUc5UdmZ4uE6voZqR6d0IcnaQCoYIlOpCtRZrdUBuH3JpvLIU4VXkKG
 zXN4ruxk/xsOfoNx+ieGWzEqI/bEBLwXtJe7m4CAGskRmJmn2YOtSyDhBwYapDqkP/8ko6
 27PaZcRF8ePlqLKmR2Q4jEn//PwXsEI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-FldbMT_iOXyAuqQ6Gq-Juw-1; Tue, 26 May 2026 13:56:24 -0400
X-MC-Unique: FldbMT_iOXyAuqQ6Gq-Juw-1
X-Mimecast-MFC-AGG-ID: FldbMT_iOXyAuqQ6Gq-Juw_1779818183
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fdacf2616so56885635e9.3
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 10:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779818183; x=1780422983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FAcLiKCSXLRb9arAXRZkzh+D3RnWx3VHk4itjUtPIUY=;
 b=KZ8fgvrULLJkyExZKZBoVArEXIBWUdsfNZmXoH0DI0ac8rMzIvH5w+GF2Yh5p+Xm99
 M19Qq+GblEmUexU6f98t6DYKTPm9TI7RFKkeyY0bkyWy3hsHMozcNXq02Q0+lB15vcoe
 OYnCmJp5igpEEKq32q474j+2mxSVU9y3LGuLqbvpEqlkzhwlk31kPPHqCkiOb1xVnkI8
 RRriDCqOYLzk+3mv+9FZfcGTyYaTSLXZGDN0COtoqxzuhbO9yajXwjPjCJS3mh66IXPK
 /rSgWqh1zsE8kJZSHJdGMLUzk/TLjfWec8vaklCI9cSNSecQVcO3y/+Lzbe5aMExURF4
 offQ==
X-Gm-Message-State: AOJu0YzQEWWKbbAv/EEcD+XWHDSecyGHJBdtROfp15BrXXiLwr0GncB4
 EmseywcOEE7FwvsUOc/dfNp4dqS5GuGPDbpL+eu+mEpHR7Yw0Jt0EBNxpDgTGXmtemMXlJl4QP8
 7GiQxbBBqXBtFJXpDz7X12U3KFuIJm1/W9iFkqSKAvzG1HBKH5JprgJs=
X-Gm-Gg: Acq92OGP3sq2C+IX3HI68RYbHQW9Ukj13np/oCbNVStfdOzuPnnovHQj8dnCg7PGnQi
 ZD71bdaTPA9VeHEMkdWbqMnGUkwLTGGDCH+UdPR4+XHEX2/qUhp4ANN1en0KeZt+I0zLW1GWTHp
 lt5umLDf+IyDJuIJ27xq4EpnkEOL8ZWmQRkwycgf5518eYPrBYtFXGBnVfS7xmO1lhDwHl3Pn4O
 3WxyWrVdtal/kq7W4WBWBdB3X8WTiOXX4PIs5eFDj8SDniPImFg2P/02ceIsDRkNKlSM7rSAWIG
 YVnZvN8Dqxwl+eunTTKLWLSP17VYtmxfK2TEvUH2XYyVNk51igPOkZN4U/3nBQaBcKBb4Pq1DaQ
 McaFbfrz4zm/cs8ODFH/PScoq4so1+rf1b1kwhVhSKFK9hMREv2f3GAR5xIgjA1DPCHDhfgPEqM
 YUUetugmrH50/PWyAJdnofBXfhriE=
X-Received: by 2002:a05:600c:4591:b0:490:6869:46c6 with SMTP id
 5b1f17b1804b1-490686947a8mr134937395e9.31.1779818182463; 
 Tue, 26 May 2026 10:56:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4591:b0:490:6869:46c6 with SMTP id
 5b1f17b1804b1-490686947a8mr134936785e9.31.1779818181906; 
 Tue, 26 May 2026 10:56:21 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.251.208])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454c60b5sm376108515e9.1.2026.05.26.10.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 10:56:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org, armbru@redhat.com, marcandre.lureau@redhat.com,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 01/19] rust/qobject: add basic bindings
Date: Tue, 26 May 2026 19:56:00 +0200
Message-ID: <20260526175618.227743-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526175618.227743-1-pbonzini@redhat.com>
References: <20260526175618.227743-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q_Yh_nA7USZcEqGvlSSQFKVaigD4i93PsJ0B_kkW9Ic_1779818183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 rust/util/src/lib.rs         |   4 +
 rust/util/src/qobject/mod.rs | 333 +++++++++++++++++++++++++++++++++++
 3 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 rust/util/src/qobject/mod.rs

diff --git a/include/qobject/qobject.h b/include/qobject/qobject.h
index 02f4c6a6eb2..f5bbcf243f7 100644
--- a/include/qobject/qobject.h
+++ b/include/qobject/qobject.h
@@ -35,7 +35,10 @@
 #include "qemu/atomic.h"
 #include "qapi/qapi-builtin-types.h"
 
-/* Not for use outside include/qobject/ */
+/*
+ * Not for use outside include/qobject/ (and Rust bindings, when they
+ * have to redo inline functions defined here).
+ */
 struct QObjectBase_ {
     QType type;
     size_t refcnt;
diff --git a/rust/util/src/lib.rs b/rust/util/src/lib.rs
index 436c67e139e..4793c23f4b0 100644
--- a/rust/util/src/lib.rs
+++ b/rust/util/src/lib.rs
@@ -10,6 +10,10 @@
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
index 00000000000..210078ea23e
--- /dev/null
+++ b/rust/util/src/qobject/mod.rs
@@ -0,0 +1,333 @@
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
+    /// Construct a [`QObject`] from a C `QObjectBase_` pointer.
+    /// The caller cedes its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObjectBase`_ must not be changed from C code while
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
+    /// the Rust `QObject` lives.  The caller must own a reference
+    /// to the `QObject`; if not, [`QObject::cloned_from_raw`] should
+    /// be used instead.
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
+    /// Construct a [`QObject`] from a C `QObjectBase`_ pointer.
+    /// The caller *does not* cede its reference to the returned struct.
+    ///
+    /// # Safety
+    ///
+    /// The `QObjectBase`_ must not be changed from C code while
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
2.54.0


