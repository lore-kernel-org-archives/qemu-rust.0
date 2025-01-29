Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1td57j-0008CY-OZ
	for mharc-qemu-rust@gnu.org; Wed, 29 Jan 2025 05:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td57h-0008CN-Vv
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:16:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1td57g-0003pv-9K
 for qemu-rust@nongnu.org; Wed, 29 Jan 2025 05:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738145797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+G8waqSz+sW1WzRxyXqVcZa+E1OzGMu5DN+Rnb5mGQ=;
 b=QrGp962C2vzkUATfomcM2CdFCu8byKaIcXRMuhNtKqo703zoiiai7T38jqhNcCviE1PoKJ
 ozPmlCnSlkFDajvSwEFqtquhusFxLMIK8GcI+SvJMhEpfcAhx/jEwR/xzXzi/kJ1hhSmgu
 CmNZud1hVvXsoSdTosIzCbKDrLydi0A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-wjzWrKPPMgiMl0CBr9TIVA-1; Wed, 29 Jan 2025 05:16:36 -0500
X-MC-Unique: wjzWrKPPMgiMl0CBr9TIVA-1
X-Mimecast-MFC-AGG-ID: wjzWrKPPMgiMl0CBr9TIVA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3862be3bfc9so3727568f8f.3
 for <qemu-rust@nongnu.org>; Wed, 29 Jan 2025 02:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738145793; x=1738750593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+G8waqSz+sW1WzRxyXqVcZa+E1OzGMu5DN+Rnb5mGQ=;
 b=LlHPEnQdMKTv1p6otKNGekAlBV2wZzmAfwFt2LFq3/9OoAdJ17U2zc1cIr+cT+bf4M
 C4Kcm6SZGobyUYfKUNQkP3fPhR3ERBcSG+m4hoSZQkYZtfu40wagmdcbg4ygrB6O75Cr
 E8cT7qr3ay7XidTiUD8Cq6RED4+LUwXpm//chQJRzQTSYbmVTKwBke7nRRLPqhbnsXBd
 cgw2GchfkIER7whDdYkBeLzgqgyQwvut1pfKArRRzWi6a8LftMB/wwDW86zNEi5GlSd8
 1I8GMt/bGTYu8u8JFDauR7o9IMONEQwfWkmmTFkYfS4NWQgAlzr5piQpnMLoMTqhAwOa
 i21A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs+vLkzPVyFTd3BRE3FwSVz779ugYT82b7vRp7w4SaRT7ZSlAIXfl5KhhVFl90RXGeFTNKQiyZ5aw=@nongnu.org
X-Gm-Message-State: AOJu0YxqpOlcZBee3QQ+B9Z2ECeyrd4+DlDdmKU2RxqBH617jOIa9z7A
 5/lOclygD6nh9F2iUljzSTnYq1vp219yBOD9k2dd25w1havZz9N9/gsqPUHMe2x38raYZBlhLQA
 rwdGB6ete/qnR7tB2wk5+RGW8nUSWVE4A8GLak7TpgBxf8QWiz55PoIbJjh/TTUfqKrOHYrXFzZ
 aU8dma1a99ookETyOzBAmRaobMJvgC/SrxeivLSSQ=
X-Gm-Gg: ASbGncu3dYgovLHTzaSNekdn7y7q3tOE6rqn2zSz1smMgm4dABU+wvs2CTUk2QVvwok
 bmynacHn4vlm+B7yZQINOPY8/opPlbqzLNshflZd89R8lTMKEgRkyQ1a62Ipu
X-Received: by 2002:a5d:5847:0:b0:386:3825:2c3b with SMTP id
 ffacd0b85a97d-38c5194c75cmr2063746f8f.18.1738145793551; 
 Wed, 29 Jan 2025 02:16:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl8vBQYpbHBsp1jESsQ6cQcP7IETOy40haopYAa2Ua2mN5lsq8HmtyeKT+BL6k2TtclADwNcEW0D4WLX2CbMI=
X-Received: by 2002:a5d:5847:0:b0:386:3825:2c3b with SMTP id
 ffacd0b85a97d-38c5194c75cmr2063723f8f.18.1738145793176; Wed, 29 Jan 2025
 02:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20250117194003.1173231-1-pbonzini@redhat.com>
 <20250117194003.1173231-3-pbonzini@redhat.com>
 <Z5c8gVcUn4rzVpID@intel.com>
In-Reply-To: <Z5c8gVcUn4rzVpID@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 29 Jan 2025 11:16:21 +0100
X-Gm-Features: AWEUYZkqaWvqQNdpUWQut2JEKbrMIOETSMl_-j2ga15e1vqt8M_ETs5WhouNLQE
Message-ID: <CABgObfbLaHXtoGAkUVW9CUXio-N_1A=Awq0=ZCY3G8sAO+9NXQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] rust: qom: add reference counting functionality
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qWFqyB4JFFmAcXKZEXukt2BKAkoVCIF4eLGByQZcUEw_1738145795
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 29 Jan 2025 10:16:42 -0000

On Mon, Jan 27, 2025 at 8:38=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> > +impl<T: ObjectType> Owned<T> {
> > +    /// Convert a raw C pointer into an owned reference to the QOM
> > +    /// object it points to.  The object's reference count will be
> > +    /// decreased when the `Owned` is dropped.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `ptr` is NULL.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must indeed own a reference to the QOM object.
> > +    /// The object must not be embedded in another unless the outer
> > +    /// object is guaranteed to have a longer lifetime.
> > +    ///
> > +    /// A raw pointer obtained via [`Owned::into_raw()`] can always be=
 passed
> > +    /// back to `from_raw()` (assuming the original `Owned` was valid!=
),
> > +    /// since the owned reference remains there between the calls to
> > +    /// `into_raw()` and `from_raw()`.
> > +    #[allow(clippy::missing_const_for_fn)]
> > +    pub unsafe fn from_raw(ptr: *const T) -> Self {
> > +        // SAFETY NOTE: while NonNull requires a mutable pointer, only
> > +        // Deref is implemented so the pointer passed to from_raw
> > +        // remains const
> > +        Owned(NonNull::new(ptr as *mut T).unwrap())
> > +    }
>
> ...
>
> > +    /// Increase the reference count of a QOM object and return
> > +    /// a new owned reference to it.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The object must not be embedded in another, unless the outer
> > +    /// object is guaranteed to have a longer lifetime.
> > +    pub unsafe fn from(obj: &T) -> Self {
> > +        unsafe {
> > +            object_ref(obj.as_object_mut_ptr().cast::<c_void>());
> > +
> > +            // SAFETY NOTE: while NonNull requires a mutable pointer, =
only
> > +            // Deref is implemented so the reference passed to from_ra=
w
> > +            // remains shared
> > +            Owned(NonNull::new_unchecked(obj.as_mut_ptr()))
> > +        }
> > +    }
> > +}
> > +
>
> About the difference between from_raw() and from(), I understand if the
> C side also holds a pointer, the Rust side must increase the reference
> count (using Owned::from), and If the C side does not have any other
> pointers, Rust can directly use Owned::from_raw. Am I right?

Pretty much - more precisely you use Object::from_raw 1) if the C side
gifts a reference 2) if you got the pointer from Owned::into_raw. The
second case is similar to Arc::from_raw, which expects that you got a
reference from Arc::into_raw. The first is the more common case.

>
> * The use of from():
>
>                 let clk =3D bindings::qdev_init_clock_in(...)
>                 Owned::from(&*clk)

In this case the C side wants to manage the reference that
qdev_init_clock_in() returns; it is dropped in
qdev_finalize_clocklist(). So Rust code needs to increase the
refcount.

> * The use of from_raw():
>
>     fn new() -> Owned<Self> {
>         assert!(bql_locked());
>         // SAFETY: the object created by object_new is allocated on
>         // the heap and has a reference count of 1
>         unsafe {
>             let obj =3D &*object_new(Self::TYPE_NAME.as_ptr());
>             Owned::from_raw(obj.unsafe_cast::<Self>())
>         }
>     }

In this case the C side lets the caller manage the (only) reference
when object_new returns, so you must not increase the refcount.

Owned::from() is slightly less efficient, though that almost never
matters. If it does you can use ManuallyDrop::new(Owned::from_raw(p)).

> Comparing with these 2 use cases, I find the difference is
> qdev_init_clock_in() creates a pointer in qdev_init_clocklist().

That is related, but more precisely the difference is that
qdev_init_clock_in() wants to unref that pointer later.

> Then the comment "the clock is heap allocated and does not have
> a reference" sounds like a conflict. I'm sure I'm missing something. :-(

Changed:

      // SAFETY: the clock is heap allocated, but qdev_init_clock_in()
      // does not gift the reference to its caller; so use Owned::from to
      // add one.  the callback is disabled automatically when the clock
      // is unparented, which happens before the device is finalized.


Thanks for the review!

Paolo


