Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3342CCCA470
	for <qemu-rust@archiver.kernel.org>; Wed,  1 Oct 2025 08:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v3rmM-0005k0-9V; Wed, 01 Oct 2025 04:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rmC-0005fF-DM
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1v3rlq-00060R-GZ
 for qemu-rust@nongnu.org; Wed, 01 Oct 2025 04:01:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759305662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U//zWjs8948Jmif4YqqydxnuJ/4LdsCs6dygVT6Q5oI=;
 b=U9fNPBo4cGQ6dL4uC62Cg2Qp1RefN3XOTxeMS49d9pziteTWn8o9z3UEcsZygPpMg2OnJK
 cmU3gHBYqfpiU0cZwn0HQPKsZEXBXe5xHkMp0p3dZCIHZMTtrkgW6svIsT7ImxodTF874d
 ECsdzms4S4a8KWHMf1diD+tdardf6Og=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-e_KMO9nMOQqmwh3wczlfEA-1; Wed, 01 Oct 2025 04:01:00 -0400
X-MC-Unique: e_KMO9nMOQqmwh3wczlfEA-1
X-Mimecast-MFC-AGG-ID: e_KMO9nMOQqmwh3wczlfEA_1759305660
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634b3584d4bso992867a12.3
 for <qemu-rust@nongnu.org>; Wed, 01 Oct 2025 01:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759305659; x=1759910459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U//zWjs8948Jmif4YqqydxnuJ/4LdsCs6dygVT6Q5oI=;
 b=JXrIacEi57LOln06nIG/y/FYAMiqJY3HVNH49ubXmfeK1/td5SCzW0Jy/TbBRfTHLm
 mQphUjp5Gjqa+SPN1S4wiW1ZZ7tq4IJHJXjhu4EhGFuTmewbVf8hWEizji354AGz9jF7
 lgbIu2ov9Fk9caSuJMWMpiupF6tmmd56CA9QWNtOJ2+bx3O5e3nZR3clN5uaK0n/IRrF
 HHk8qr+2HCAcgNCmd5Ee8QuSXDn1q9e445Tc6VSoiHIfXZBFkpk57xgyhlXpF5LkXofl
 zMX1IujmJ9Qw3Wa/6SX8ZGRTD9fVsrUDTH5uJHttfhCD6GxAJyBothvfbtblPAG92nw5
 C8LA==
X-Gm-Message-State: AOJu0YwvkUiqf3Tm+LE7Ee0x5bDd689KDhUxxxEsn7rpz70d5uJsW3VP
 +oxMtC9WqmHfLVMnZpCis1KjqzXa5L2ImloKpbbMknJ580UUZBUd1X0nOob/NbO/smPXPkIjQc9
 sWIyitUxdt37TAs50nnoI0/equx3ckmRLs8czQyFKxAvN4RwrwvXzQMwqyDcIgCQ=
X-Gm-Gg: ASbGncsrCK13bRctVgDIg5Vtl2pqN5DNDvN6vM2U+KTuyjZV8aLjT+N+cNaWOVfEdzj
 ivn5Zo+dBfmIBR1hHYYbg3BYJwxbn3jTzF4LovguIw/qEpx9x2Ri5JraF5TKk4xEzIMtgksFLHS
 64x2Qp8G5KdU0BJuyhQiHLK6SUa2CFzUGbbi27/gwRXqV6gzHtbZpBbyy9hyLN0st+IEk3ngYE7
 kvcs9d+xJFGYdicd2sgCP4AUBKLtJv+a/lv2JVHHhrMpB8Gg7IDp91ecaB6ISF97rg0lL2y1Gr/
 VJN12DSariiCii+qIthvCI76FHXt3akYpDZn7hbbVDLpJ+RkPcDr01vI7OHH4tAAla21drLpP5B
 lDDWOwYuw/Fzp9Lb17TVK3X4QHzpa087jFJkCkvy1n5YZteUfCj4=
X-Received: by 2002:a17:907:7b8a:b0:b45:cd43:8a93 with SMTP id
 a640c23a62f3a-b46e9a4c070mr360342266b.62.1759305657930; 
 Wed, 01 Oct 2025 01:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrAwmd1jmCOX3k2Vqlf0oEzg754284WmBRJX+sJEh/pA/jhi2leDiOLWI1j1HtcG/PWM4DVQ==
X-Received: by 2002:a17:907:7b8a:b0:b45:cd43:8a93 with SMTP id
 a640c23a62f3a-b46e9a4c070mr360335066b.62.1759305657322; 
 Wed, 01 Oct 2025 01:00:57 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.127.188])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353f87511dsm1318016966b.43.2025.10.01.01.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 01:00:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org,
	armbru@redhat.com,
	marcandre.lureau@redhat.com
Subject: [PATCH 02/14] rust: add basic QObject bindings
Date: Wed,  1 Oct 2025 10:00:39 +0200
Message-ID: <20251001080051.1043944-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001075005.1041833-1-pbonzini@redhat.com>
References: <20251001075005.1041833-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GMLYZ6EbbjB7t94wbm_hx-R3Om5tlQnIEN8VJUTPPzE_1759305660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/util/wrapper.h          |   7 +
 rust/util/meson.build        |   6 +-
 rust/util/src/lib.rs         |   2 +
 rust/util/src/qobject/mod.rs | 309 +++++++++++++++++++++++++++++++++++
 4 files changed, 322 insertions(+), 2 deletions(-)
 create mode 100644 rust/util/src/qobject/mod.rs

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
index b0b75e93ff6..38da1ba8cd1 100644
--- a/rust/util/meson.build
+++ b/rust/util/meson.build
@@ -36,8 +36,10 @@ _util_rs = static_library(
       'src/module.rs',
       'src/timer.rs',
     ],
-    {'.': _util_bindings_inc_rs}
-  ),
+    {'.': _util_bindings_inc_rs,
+    'qobject': [
+      'src/qobject/mod.rs',
+    ]}),
   override_options: ['rust_std=2021', 'build.rust_std=2021'],
   rust_abi: 'rust',
   dependencies: [anyhow_rs, libc_rs, foreign_rs, glib_sys_rs, common_rs, qom, qemuutil],
diff --git a/rust/util/src/lib.rs b/rust/util/src/lib.rs
index 16c89b95174..fe0128103c8 100644
--- a/rust/util/src/lib.rs
+++ b/rust/util/src/lib.rs
@@ -4,6 +4,8 @@
 pub mod error;
 pub mod log;
 pub mod module;
+#[macro_use]
+pub mod qobject;
 pub mod timer;
 
 pub use error::{Error, Result};
diff --git a/rust/util/src/qobject/mod.rs b/rust/util/src/qobject/mod.rs
new file mode 100644
index 00000000000..f43d87a3b66
--- /dev/null
+++ b/rust/util/src/qobject/mod.rs
@@ -0,0 +1,309 @@
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
+    /// and the C `QObject` pointer is leaked.
+    pub fn into_raw(self) -> *mut bindings::QObject {
+        let src = ManuallyDrop::new(self);
+        src.0.get()
+    }
+
+    /// Construct a [`QObject`] from a C `QObject` pointer.
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
+impl From<()> for QObject {
+    fn from(_null: ()) -> Self {
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
+        unsafe { QObject::from_base(addr_of!(qobj.base)) }
+    }
+}
+
+macro_rules! from_int {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_int(n.into()) };
+                unsafe { QObject::from_base(addr_of!(qobj.base)) }
+            }
+        }
+    };
+}
+
+from_int!(i8);
+from_int!(i16);
+from_int!(i32);
+from_int!(i64);
+
+macro_rules! from_uint {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_uint(n.into()) };
+                unsafe { QObject::from_base(addr_of!(qobj.base)) }
+            }
+        }
+    };
+}
+
+from_uint!(u8);
+from_uint!(u16);
+from_uint!(u32);
+from_uint!(u64);
+
+macro_rules! from_double {
+    ($t:ty) => {
+        impl From<$t> for QObject {
+            fn from(n: $t) -> Self {
+                let qobj = unsafe { &*bindings::qnum_from_double(n.into()) };
+                unsafe { QObject::from_base(addr_of!(qobj.base)) }
+            }
+        }
+    };
+}
+
+from_double!(f32);
+from_double!(f64);
+
+impl From<CString> for QObject {
+    fn from(s: CString) -> Self {
+        let qobj = unsafe { &*bindings::qstring_from_str(s.as_ptr()) };
+        unsafe { QObject::from_base(addr_of!(qobj.base)) }
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
+            let elem: *mut bindings::QObject = elem.0.get();
+            unsafe {
+                bindings::qlist_append_obj(qlist, elem);
+            }
+        }
+        unsafe { QObject::from_base(addr_of!(qlist.base)) }
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
+        unsafe { QObject::from_base(addr_of!(qdict.base)) }
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
+                        _ => {}
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
2.51.0


