Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uOefy-0000Ub-Ke
	for mharc-qemu-rust@gnu.org; Mon, 09 Jun 2025 11:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefx-0000UL-Jg
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uOefv-0007iG-68
 for qemu-rust@nongnu.org; Mon, 09 Jun 2025 11:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749483878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epM41E1l12D6pUwXy3YmY7/Hvv8B/vOVwD8gZKKOhHo=;
 b=IwLbV0ck1wl74o28qEBZC5ZCpMbDwb2Y0XplfuwaFbD7WXC9J3GNfdUGMdMVzHYjQPa3Ta
 9m4OVExOAGr2w4edhZtTqB+4liPx/s2UTGg9GfWBZrq2vm/fysq3ofCOgqrNM6MY1modgD
 /mYuhkHwCn+xzC6kDz6kcxgWuvg/5Fw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-OAVs-d_ZPu2uQEi0WKVenQ-1; Mon, 09 Jun 2025 11:44:36 -0400
X-MC-Unique: OAVs-d_ZPu2uQEi0WKVenQ-1
X-Mimecast-MFC-AGG-ID: OAVs-d_ZPu2uQEi0WKVenQ_1749483875
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so2144542f8f.0
 for <qemu-rust@nongnu.org>; Mon, 09 Jun 2025 08:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749483874; x=1750088674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=epM41E1l12D6pUwXy3YmY7/Hvv8B/vOVwD8gZKKOhHo=;
 b=ceCnVMXJLspX75WjykPlS/ZmimjJcfKzimk9U4u57HairVh7of6Yvrj6zvgTIx+OWu
 ceBGTWPxFJKk2PpUCwJnRfsdSs/kwgWqBv/N5YUCOC4nB5fo+yP2zsl1hstEgW/O4A0j
 JylPXt5hLY7A8Z/59ILxeMSNBDmT8Ev5VVapwdbpzI0L70o5uZknIbcygcFiN9A1uUZb
 pNAugHR1k3Oo07hMW0wCIq60x32MehH0F7zzHKQau8b1OotT8YLwwbGFi7kSGo/ifvxJ
 V3O6PNFBZ0Gr1fTtVnM9AiRpZc6QB/ZNFN8shYncvOFe+2iSvtbptWNyUaTwatAee4wl
 0kvQ==
X-Gm-Message-State: AOJu0YyEko1N52c951GQle8SqmVwuCh1DMcESncJjDrFhTjBgJvF6GIX
 fG+NVb3gfOfKGZUWOXDVPAZb7v20J3xL9f9E9v2Ri9+he9XAA3tfiz2Lrb164K8rZC1S0bMHoR4
 Y16fldFtovlle964PhX0Y1aYLMnDjkqYXPp8Phfy1tJO0Ar8nW+fOEXtvtp+GDYE=
X-Gm-Gg: ASbGncsHTPc0kEH7xzw4hWn3MScrk5+5m399i8iQfbDaI+cF1e0qpCmyhTumFPa/SEO
 Wdl/QS3gMEH4L/lR/FUWdMnl7GtYGoIYcWDyT+ZbpCpspsJvmy8PbG7bNMIsrx/enPWjKv/keLT
 iri5lqENyLuRz/IqoeJsa2nAOLspiz8BgTVReT1gy5KQV/Z3kADQYHLhnkCT5FmCzSqWOrpJjNC
 lp3BtmLwrrL48xnzgMywsBNn42MmlByfSYiHfDcYxtHbe5uXtiHKam26SNp3Fzo07SavrZ2usVL
 TsHu7mIATiMsa1XD5P//rzMS
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ed9a:7016 with SMTP id
 ffacd0b85a97d-3a551427f0emr4290f8f.26.1749483874454; 
 Mon, 09 Jun 2025 08:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjGUAEUHvdGNUkTj0micNOMkn375JR2vzYSokk4elbOzTyj8ZmQQscRYA7Y6NVFIefwQPwAQ==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ed9a:7016 with SMTP id
 ffacd0b85a97d-3a551427f0emr4273f8f.26.1749483873965; 
 Mon, 09 Jun 2025 08:44:33 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.64.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45307b9d827sm65817845e9.22.2025.06.09.08.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 08:44:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-rust@nongnu.org
Subject: [PATCH 4/5] rust: qom: make ParentInit lifetime-invariant
Date: Mon,  9 Jun 2025 17:44:22 +0200
Message-ID: <20250609154423.706056-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609154423.706056-1-pbonzini@redhat.com>
References: <20250609154423.706056-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PM0f4hyJBgeGFIPUwi-WlIr1rJ2qd2HCLBNg-jQ5DmY_1749483875
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 09 Jun 2025 15:44:41 -0000

This is the trick that allows the parent-field initializer to be used
only for the object that it's meant to be initialized.  This way,
the owner of a MemoryRegion must be the object that embeds it.

More information is in the comments; it's best explained with a simplified
example.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 rust/qemu-api/src/qom.rs | 88 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 4 deletions(-)

diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
index 21c271cd2f9..1481ef20f0c 100644
--- a/rust/qemu-api/src/qom.rs
+++ b/rust/qemu-api/src/qom.rs
@@ -95,6 +95,7 @@
 use std::{
     ffi::{c_void, CStr},
     fmt,
+    marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     ptr::NonNull,
@@ -208,12 +209,91 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> Result<(), fmt::Error> {
 
 /// This struct knows that the superclasses of the object have already been
 /// initialized.
-pub struct ParentInit<'a, T>(&'a mut MaybeUninit<T>);
+///
+/// The declaration of `ParentInit` is.. *"a kind of magic"*.  It uses a
+/// technique that is found in several crates, the main ones probably being
+/// `ghost-cell` (in fact it was introduced by the [`GhostCell` paper](https://plv.mpi-sws.org/rustbelt/ghostcell/))
+/// and `generativity`.
+///
+/// The `PhantomData` makes the `ParentInit` type *invariant* with respect to
+/// the lifetime argument `'init`.  This, together with the `for<'...>` in
+/// `[ParentInit::with]`, block any attempt of the compiler to be creative when
+/// operating on types of type `ParentInit` and to extend their lifetimes.  In
+/// particular, it ensures that the `ParentInit` cannot be made to outlive the
+/// `rust_instance_init()` function that creates it, and therefore that the
+/// `&'init T` reference is valid.
+///
+/// This implementation of the same concept, without the QOM baggage, can help
+/// understanding the effect:
+///
+/// ```
+/// use std::marker::PhantomData;
+///
+/// #[derive(PartialEq, Eq)]
+/// pub struct Jail<'closure, T: Copy>(&'closure T, PhantomData<fn(&'closure ()) -> &'closure ()>);
+///
+/// impl<'closure, T: Copy> Jail<'closure, T> {
+///     fn get(&self) -> T {
+///         *self.0
+///     }
+///
+///     #[inline]
+///     fn with<U>(v: T, f: impl for<'id> FnOnce(Jail<'id, T>) -> U) -> U {
+///         let parent_init = Jail(&v, PhantomData);
+///         f(parent_init)
+///     }
+/// }
+/// ```
+///
+/// It's impossible to escape the `Jail`; `token1` cannot be moved out of the
+/// closure:
+///
+/// ```ignore
+/// let x = 42;
+/// let escape = Jail::with(&x, |token1| {
+///     println!("{}", token1.get());
+///     token1
+/// });
+/// // fails to compile:
+/// println!("{}", escape.get());
+/// ```
+///
+/// Likewise, in the QOM case the `ParentInit` cannot be moved out of
+/// `instance_init()`. Without this trick it would be possible to stash a
+/// `ParentInit` and use it later to access uninitialized memory.
+///
+/// Here is another example, showing how separately-created "identities" stay
+/// isolated:
+///
+/// ```ignore
+/// impl<'closure, T: Copy> Clone for Jail<'closure, T> {
+///     fn clone(&self) -> Jail<'closure, T> {
+///         Jail(self.0, PhantomData)
+///     }
+/// }
+///
+/// fn main() {
+///     Jail::with(42, |token1| {
+///         // this works and returns true: the clone has the same "identity"
+///         println!("{}", token1 == token1.clone());
+///         Jail::with(42, |token2| {
+///             // here the outer token remains accessible...
+///             println!("{}", token1.get());
+///             // ... but the two are separate: this fails to compile:
+///             println!("{}", token1 == token2);
+///         });
+///     });
+/// }
+/// ```
+pub struct ParentInit<'init, T>(
+    &'init mut MaybeUninit<T>,
+    PhantomData<fn(&'init ()) -> &'init ()>,
+);
 
-impl<'a, T> ParentInit<'a, T> {
+impl<'init, T> ParentInit<'init, T> {
     #[inline]
-    pub fn with(obj: &'a mut MaybeUninit<T>, f: impl FnOnce(ParentInit<'a, T>)) {
-        let parent_init = ParentInit(obj);
+    pub fn with(obj: &'init mut MaybeUninit<T>, f: impl for<'id> FnOnce(ParentInit<'id, T>)) {
+        let parent_init = ParentInit(obj, PhantomData);
         f(parent_init)
     }
 }
-- 
2.49.0


