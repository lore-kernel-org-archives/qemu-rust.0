Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tI4GB-00053O-QI
	for mharc-qemu-rust@gnu.org; Mon, 02 Dec 2024 06:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tI4Fy-0004yf-Qs
 for qemu-rust@nongnu.org; Mon, 02 Dec 2024 06:06:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tI4Fv-0005Bs-Og
 for qemu-rust@nongnu.org; Mon, 02 Dec 2024 06:06:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733137579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFZVeuOocEdpSoBqzsPyrTYWx9pROq8j1tqsBgVVe5Y=;
 b=O++YL7L+BHjgA3a6n8dDHdDrv1bPwxXrd9ySUOQF85TQc4Vwg8IzBRzIKCpFmPaO8i3qWG
 Hon3aW7cM+mr5sZPhtksRL+VWD1s7QLlPzrEYGxJfHIMy48zOa5pAjd92OgqH7Wk9+9Jr/
 RYDW4fYU2mrBnjzQDAnoG6xN8cyBLhc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-w9lg_LD_MHyk7tvyJG7Tgg-1; Mon, 02 Dec 2024 06:06:18 -0500
X-MC-Unique: w9lg_LD_MHyk7tvyJG7Tgg-1
X-Mimecast-MFC-AGG-ID: w9lg_LD_MHyk7tvyJG7Tgg
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-466911d43f4so64626851cf.3
 for <qemu-rust@nongnu.org>; Mon, 02 Dec 2024 03:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733137576; x=1733742376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vFZVeuOocEdpSoBqzsPyrTYWx9pROq8j1tqsBgVVe5Y=;
 b=hhiXEHkrxNfWUrg3ioiRRNVqcooXor9AeUdWIuB1gB4PmUwrCJ32lpbAMpk+In0SiZ
 kkDCsLXnyiIhRI0DkT5AMIzUXqJpIm82rmTc1tB5Q5Tz9iZYXZ99qLF+ghtGT9luN5hR
 VD2QrfSmH1D3YIZ/NXQCwTGycKqnUgcAbrQi53hvGGGNGNQeuzwIS4px7g1P/GZp376U
 wUKm6pnVuhffhgX2Mz+cQ3XuHYzamb8Q8KvsmdorQ7xQa/GBVdWuU5ZeRzhAPWQT9AyZ
 305lD7IIB5/MMGK6nu93q8EZGO6i+QStM67nAhbGKFcQbolgnY5oomOCAcPE9luMEca6
 8lVw==
X-Gm-Message-State: AOJu0Yzi++MOZPf3j9Blb4BmyVj/74UFpn8Nm7H2wBxqFopNNdCyANSB
 VNnpmZVbh3h4zjBlUcVqBuYgPKVXKGpF+AjGXr2cAvnUhMzJFGkNrIVkRFmGAAODpR2JEdBYNnt
 SIGRAgl8vw7+BMAYcvhngC1HMYo6vQLh8OJLoVT/bs4Pe5Zn08iutOlxZNlc=
X-Gm-Gg: ASbGncvL7/HQnsi34GnlQKBg1KGwhaNHhC7NAu0/75f7RsYjRZrrSW8ezxtP2lDkYPw
 KUUmQJtHE5fsw5RU6Ev7KRGiQQnw4PK/VIMM2XHY0Oj84VBIbjlkQNiWrwWZelKSxAxSAC/Dr9W
 DybcZ901qg+VEuJBQ32XzbcvZ6w5IFBfQyJdGAgDGoRHkEswlJA6xYFcGtzUE+a9tGIw5wO1gbz
 P+zPyqX9yHxlumT1ZogvaP3FmolPnC1LvumxIFjdT+mCJsYch/RqQlRTsV7fD6oKSrLPSzdy5t4
 u38=
X-Received: by 2002:a05:622a:54b:b0:460:ac8f:3bcd with SMTP id
 d75a77b69052e-466b36907c2mr339740961cf.45.1733137575658; 
 Mon, 02 Dec 2024 03:06:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfsZJO5oK63TazZCpQWjKPNuzi/ehU/+0hdR27r9yQHQ9y77lj7wwDVglADmdjasAgOse/zA==
X-Received: by 2002:a05:622a:54b:b0:460:ac8f:3bcd with SMTP id
 d75a77b69052e-466b36907c2mr339740561cf.45.1733137575109; 
 Mon, 02 Dec 2024 03:06:15 -0800 (PST)
Received: from [192.168.122.1] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b68492121esm392311385a.3.2024.12.02.03.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 03:06:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH v2 1/2] rust: add BQL-enforcing Cell variant
Date: Mon,  2 Dec 2024 12:06:08 +0100
Message-ID: <20241202110609.36775-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241202110609.36775-1-pbonzini@redhat.com>
References: <20241202110609.36775-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hlwVd6U0DTtVoAsf4wChog6RtS6cEA61whroDOdZMHs_1733137577
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 02 Dec 2024 11:06:26 -0000

QEMU objects usually have their pointer shared with the "outside
world" very early in their lifetime, for example when they create their
MemoryRegions.  Because at this point it is not valid anymore to
create a &mut reference to the device, individual parts of the
device struct must be made mutable in a controlled manner.

QEMU's Big Lock (BQL) effectively turns multi-threaded code into
single-threaded code while device code runs, as long as the BQL is not
released while the device is borrowed (because C code could sneak in and
mutate the device).  We can then introduce custom interior mutability primitives
that are semantically similar to the standard library's (single-threaded)
Cell and RefCell, but account for QEMU's threading model.  Accessing
the "BqlCell" or borrowing the "BqlRefCell" requires proving that the
BQL is held, and attempting to access without the BQL is a runtime panic,
similar to RefCell's already-borrowed panic.

With respect to naming I also considered omitting the "Bql" prefix or
moving it to the module, e.g.  qemu_api::bql::{Cell, RefCell}.  However,
this could easily lead to mistakes and confusion; for example rustc could
suggest the wrong import, leading to subtle bugs.

As a start introduce the an equivalent of Cell.  Almost all of the code
was taken from Rust's standard library, while removing unstable features
and probably-unnecessary functionality that constitute a large of the
original code.  A lot of what's left is documentation, as well as unit
tests in the form of doctests.  These are not yet integrated in "make
check" but can be run with "cargo test --doc".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/meson.build |   1 +
 rust/qemu-api/src/cell.rs | 298 ++++++++++++++++++++++++++++++++++++++
 rust/qemu-api/src/lib.rs  |   1 +
 3 files changed, 300 insertions(+)
 create mode 100644 rust/qemu-api/src/cell.rs

diff --git a/rust/qemu-api/meson.build b/rust/qemu-api/meson.build
index d719c13f46d..edc21e1a3f8 100644
--- a/rust/qemu-api/meson.build
+++ b/rust/qemu-api/meson.build
@@ -13,6 +13,7 @@ _qemu_api_rs = static_library(
     [
       'src/lib.rs',
       'src/bindings.rs',
+      'src/cell.rs',
       'src/c_str.rs',
       'src/definitions.rs',
       'src/device_class.rs',
diff --git a/rust/qemu-api/src/cell.rs b/rust/qemu-api/src/cell.rs
new file mode 100644
index 00000000000..373be23ba8b
--- /dev/null
+++ b/rust/qemu-api/src/cell.rs
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: MIT
+//
+// This file is based on library/core/src/cell.rs from
+// Rust 1.82.0.
+//
+// Permission is hereby granted, free of charge, to any
+// person obtaining a copy of this software and associated
+// documentation files (the "Software"), to deal in the
+// Software without restriction, including without
+// limitation the rights to use, copy, modify, merge,
+// publish, distribute, sublicense, and/or sell copies of
+// the Software, and to permit persons to whom the Software
+// is furnished to do so, subject to the following
+// conditions:
+//
+// The above copyright notice and this permission notice
+// shall be included in all copies or substantial portions
+// of the Software.
+//
+// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
+// ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
+// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
+// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
+// SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
+// IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+// DEALINGS IN THE SOFTWARE.
+
+//! BQL-protected mutable containers.
+//!
+//! Rust memory safety is based on this rule: Given an object `T`, it is only
+//! possible to have one of the following:
+//!
+//! - Having several immutable references (`&T`) to the object (also known as
+//!   **aliasing**).
+//! - Having one mutable reference (`&mut T`) to the object (also known as
+//!   **mutability**).
+//!
+//! This is enforced by the Rust compiler. However, there are situations where
+//! this rule is not flexible enough. Sometimes it is required to have multiple
+//! references to an object and yet mutate it. In particular, QEMU objects
+//! usually have their pointer shared with the "outside world very early in
+//! their lifetime", for example when they create their
+//! [`MemoryRegion`s](crate::bindings::MemoryRegion).  Therefore, individual
+//! parts of a  device must be made mutable in a controlled manner through the
+//! use of cell types.
+//!
+//! This module provides a way to do so via the Big QEMU Lock.  While
+//! [`BqlCell<T>`] is essentially the same single-threaded primitive that is
+//! available in `std::cell`, the BQL allows it to be used from a multi-threaded
+//! context and to share references across threads, while maintaining Rust's
+//! safety guarantees.  For this reason, unlike its `std::cell` counterpart,
+//! `BqlCell` implements the `Sync` trait.
+//!
+//! BQL checks are performed in debug builds but can be optimized away in
+//! release builds, providing runtime safety during development with no overhead
+//! in production.
+//!
+//! Warning: While `BqlCell` is similar to its `std::cell` counterpart, the two
+//! are not interchangeable. Using `std::cell` types in QEMU device
+//! implementations is usually incorrect and can lead to thread-safety issues.
+//!
+//! ## `BqlCell<T>`
+//!
+//! [`BqlCell<T>`] implements interior mutability by moving values in and out of
+//! the cell. That is, an `&mut T` to the inner value can never be obtained as
+//! long as the cell is shared. The value itself cannot be directly obtained
+//! without copying it, cloning it, or replacing it with something else. This
+//! type provides the following methods, all of which can be called only while
+//! the BQL is held:
+//!
+//!  - For types that implement [`Copy`], the [`get`](BqlCell::get) method
+//!    retrieves the current interior value by duplicating it.
+//!  - For types that implement [`Default`], the [`take`](BqlCell::take) method
+//!    replaces the current interior value with [`Default::default()`] and
+//!    returns the replaced value.
+//!  - All types have:
+//!    - [`replace`](BqlCell::replace): replaces the current interior value and
+//!      returns the replaced value.
+//!    - [`set`](BqlCell::set): this method replaces the interior value,
+//!      dropping the replaced value.
+
+use std::{cell::UnsafeCell, cmp::Ordering, fmt, mem};
+
+use crate::bindings;
+
+// TODO: When building doctests do not include the actual BQL, because cargo
+// does not know how to link them to libqemuutil.  This can be fixed by
+// running rustdoc from "meson test" instead of relying on cargo.
+fn bql_locked() -> bool {
+    // SAFETY: the function does nothing but return a thread-local bool
+    !cfg!(MESON) || unsafe { bindings::bql_locked() }
+}
+
+/// A mutable memory location that is protected by the Big QEMU Lock.
+///
+/// # Memory layout
+///
+/// `BqlCell<T>` has the same in-memory representation as its inner type `T`.
+#[repr(transparent)]
+pub struct BqlCell<T> {
+    value: UnsafeCell<T>,
+}
+
+// SAFETY: Same as for std::sync::Mutex.  In the end this *is* a Mutex,
+// except it is stored out-of-line
+unsafe impl<T: Send> Send for BqlCell<T> {}
+unsafe impl<T: Send> Sync for BqlCell<T> {}
+
+impl<T: Copy> Clone for BqlCell<T> {
+    #[inline]
+    fn clone(&self) -> BqlCell<T> {
+        BqlCell::new(self.get())
+    }
+}
+
+impl<T: Default> Default for BqlCell<T> {
+    /// Creates a `BqlCell<T>`, with the `Default` value for T.
+    #[inline]
+    fn default() -> BqlCell<T> {
+        BqlCell::new(Default::default())
+    }
+}
+
+impl<T: PartialEq + Copy> PartialEq for BqlCell<T> {
+    #[inline]
+    fn eq(&self, other: &BqlCell<T>) -> bool {
+        self.get() == other.get()
+    }
+}
+
+impl<T: Eq + Copy> Eq for BqlCell<T> {}
+
+impl<T: PartialOrd + Copy> PartialOrd for BqlCell<T> {
+    #[inline]
+    fn partial_cmp(&self, other: &BqlCell<T>) -> Option<Ordering> {
+        self.get().partial_cmp(&other.get())
+    }
+}
+
+impl<T: Ord + Copy> Ord for BqlCell<T> {
+    #[inline]
+    fn cmp(&self, other: &BqlCell<T>) -> Ordering {
+        self.get().cmp(&other.get())
+    }
+}
+
+impl<T> From<T> for BqlCell<T> {
+    /// Creates a new `BqlCell<T>` containing the given value.
+    fn from(t: T) -> BqlCell<T> {
+        BqlCell::new(t)
+    }
+}
+
+impl<T: fmt::Debug + Copy> fmt::Debug for BqlCell<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.get().fmt(f)
+    }
+}
+
+impl<T: fmt::Display + Copy> fmt::Display for BqlCell<T> {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.get().fmt(f)
+    }
+}
+
+impl<T> BqlCell<T> {
+    /// Creates a new `BqlCell` containing the given value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    /// ```
+    #[inline]
+    pub const fn new(value: T) -> BqlCell<T> {
+        BqlCell {
+            value: UnsafeCell::new(value),
+        }
+    }
+
+    /// Sets the contained value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    ///
+    /// c.set(10);
+    /// ```
+    #[inline]
+    pub fn set(&self, val: T) {
+        self.replace(val);
+    }
+
+    /// Replaces the contained value with `val`, and returns the old contained
+    /// value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let cell = BqlCell::new(5);
+    /// assert_eq!(cell.get(), 5);
+    /// assert_eq!(cell.replace(10), 5);
+    /// assert_eq!(cell.get(), 10);
+    /// ```
+    #[inline]
+    pub fn replace(&self, val: T) -> T {
+        assert!(bql_locked());
+        // SAFETY: This can cause data races if called from multiple threads,
+        // but it won't happen as long as C code accesses the value
+        // under BQL protection only.
+        mem::replace(unsafe { &mut *self.value.get() }, val)
+    }
+
+    /// Unwraps the value, consuming the cell.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    /// let five = c.into_inner();
+    ///
+    /// assert_eq!(five, 5);
+    /// ```
+    pub fn into_inner(self) -> T {
+        assert!(bql_locked());
+        self.value.into_inner()
+    }
+}
+
+impl<T: Copy> BqlCell<T> {
+    /// Returns a copy of the contained value.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    ///
+    /// let five = c.get();
+    /// ```
+    #[inline]
+    pub fn get(&self) -> T {
+        assert!(bql_locked());
+        // SAFETY: This can cause data races if called from multiple threads,
+        // but it won't happen as long as C code accesses the value
+        // under BQL protection only.
+        unsafe { *self.value.get() }
+    }
+}
+
+impl<T> BqlCell<T> {
+    /// Returns a raw pointer to the underlying data in this cell.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    ///
+    /// let ptr = c.as_ptr();
+    /// ```
+    #[inline]
+    pub const fn as_ptr(&self) -> *mut T {
+        self.value.get()
+    }
+}
+
+impl<T: Default> BqlCell<T> {
+    /// Takes the value of the cell, leaving `Default::default()` in its place.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use qemu_api::cell::BqlCell;
+    ///
+    /// let c = BqlCell::new(5);
+    /// let five = c.take();
+    ///
+    /// assert_eq!(five, 5);
+    /// assert_eq!(c.into_inner(), 0);
+    /// ```
+    pub fn take(&self) -> T {
+        self.replace(Default::default())
+    }
+}
diff --git a/rust/qemu-api/src/lib.rs b/rust/qemu-api/src/lib.rs
index 440aff3817d..b04d110b3f5 100644
--- a/rust/qemu-api/src/lib.rs
+++ b/rust/qemu-api/src/lib.rs
@@ -8,6 +8,7 @@
 pub mod bindings;
 
 pub mod c_str;
+pub mod cell;
 pub mod definitions;
 pub mod device_class;
 pub mod offset_of;
-- 
2.47.0


