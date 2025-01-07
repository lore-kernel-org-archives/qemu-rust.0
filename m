Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tV8d3-0004Bh-Jv
	for mharc-qemu-rust@gnu.org; Tue, 07 Jan 2025 07:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tV8d2-0004BW-MU
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 07:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tV8d0-0001tB-V8
 for qemu-rust@nongnu.org; Tue, 07 Jan 2025 07:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736252647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBhgfETM99NEMDiU1FVnu4UUpsHSbAgJWNnVsfsni24=;
 b=IkG1p5jErO4yHnGRtNHlMFoFhlQB5cC/sp1voRYkl2+OzgS8GWSQtxorQiSNhYytit9MP1
 IlYENPo1hjcmxAM7VqVrmNU8lKWilLSiCZIpiVaGrvboMPu/JTkTbZI3o3XxVFOaK/m5Ox
 qwJPf4FhUGUr573Gz6Q7t4i89AzTT1M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-sOduqcTfMgWYPb09SlbxDA-1; Tue, 07 Jan 2025 07:24:06 -0500
X-MC-Unique: sOduqcTfMgWYPb09SlbxDA-1
X-Mimecast-MFC-AGG-ID: sOduqcTfMgWYPb09SlbxDA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862b364578so7618920f8f.1
 for <qemu-rust@nongnu.org>; Tue, 07 Jan 2025 04:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736252645; x=1736857445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBhgfETM99NEMDiU1FVnu4UUpsHSbAgJWNnVsfsni24=;
 b=YgfwESBVsZpqVk78xXRGQBwJFmzPRUtp0Rud3M1C4kQ61Guq52ith8BVMkuGCf+dg4
 RU02A+ua7okQfwWy3UOdxGcapNUh1SPkaGHO0PbHkCKHmef9f34hf5o69FfNnb7rzvqs
 0shMVgT+oVQipgasQxS/kWawfXc93LXg0+aSTHEIb5HOCynQVAUU+wkSAvS6l+tGVlEy
 pxb/3Z+HQfj2fWE0Y8T8+KPk6E3YyRcjQ2SYoWvdztCV/gWb3jDBQRazxzb11vZUeq53
 ifRDp8h7RnahlZQx9Q9MftCvG1gRwksH+h9yXeFBTH/O3WJfyGVILPCDwg9IXsbuhhW4
 L8TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGGUFudsP6N0BAq+xqNALK9TJ67jgcbKlbBj9ld088WmeIirC+JuPQVpgG/m+NUnejLz/cC2Ejiwc=@nongnu.org
X-Gm-Message-State: AOJu0YySVT67w9UfSEzYy/6QeW3Lhvon0P8492Qfz2GBta3U02yrYhwz
 ogA4OufgsQyHgXeovYajIBsnxbqaT+b+j780H8nE+XQGAI/U/EdCg8IJ5l/Z4amjzt9FeeJkBS8
 F+SELVlAAizkBgt5Zjslj2ITInKi5EMeyprKKdfVaBLyquTTN6c8bl3YHPbzGDoIQhrFak51N/e
 hRxwjFZZegVGXsxelilfNBze4I5A==
X-Gm-Gg: ASbGncvkuFRI+ns52dmt9qCT9gK9ZuE6i4gakkyU7Jm8QIJBJa59ytITCCAI5/t49u7
 RhTzIEyrg5kQdfCHBLHAZicI6GxsKc5mxeOi3Ow==
X-Received: by 2002:a5d:5f56:0:b0:382:45db:6a1e with SMTP id
 ffacd0b85a97d-38a7913bcf8mr2711313f8f.14.1736252644727; 
 Tue, 07 Jan 2025 04:24:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdCOBT/WPKqbvxYoZE1G1ce2F6839rhweRBKlBnacFSZhluProYmcnIpDOweSXkOJJ9GaBJbJOd+9g+ItmULs=
X-Received: by 2002:a5d:5f56:0:b0:382:45db:6a1e with SMTP id
 ffacd0b85a97d-38a7913bcf8mr2711195f8f.14.1736252642416; Tue, 07 Jan 2025
 04:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20241231002336.25931-1-pbonzini@redhat.com>
 <20241231002336.25931-2-pbonzini@redhat.com>
 <Z3zstgKXAgeRrIU2@intel.com>
In-Reply-To: <Z3zstgKXAgeRrIU2@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 7 Jan 2025 13:23:50 +0100
Message-ID: <CABgObfbdFo9B1nedC+Bu2QQfjTL1TOpmSQt0p0a0d0iWev6UKg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] rust: vmstate: add new type safe implementation
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, junjie.mao@hotmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x7Pf6AT4sTn7LL1L4km6vJ76a6xFYOiThh6WYjnZhqc_1736252645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 07 Jan 2025 12:24:12 -0000

On Tue, Jan 7, 2025 at 9:39=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrote=
:
> This is very good work! I am curious about how QEMU plays with Rust
> forum:
>
> Rust forum's disscussion is under MIT and Apache 2.0 licenses [1], and
> since vmstate.rs is under the GPLv2 license, do we need to specify that
> certain code retains the MIT license?

I will add a note similar to the one that is already there in offset_of.

> > +/// ```
> > +/// # use qemu_api::call_func_with_field;
> > +/// # use core::marker::PhantomData;
> > +/// const fn size_of_field<T>(_: PhantomData<T>) -> usize {
> > +///     std::mem::size_of::<T>()
> > +/// }
> > +///
> > +/// struct Foo {
> > +///     x: u16,
> > +/// };
> > +/// // calls size_of_field::<u16>()
> > +/// assert_eq!(call_func_with_field!(size_of_field, Foo, x), 2);
> > +/// ```
> > +#[macro_export]
> > +macro_rules! call_func_with_field {
> > +    ($func:expr, $typ:ty, $($field:tt).+) =3D> {
> > +        $func(loop {
> > +            #![allow(unreachable_code)]
> > +            const fn phantom__<T>(_: &T) -> ::core::marker::PhantomDat=
a<T> { ::core::marker::PhantomData }
> > +            // Unreachable code is exempt from checks on uninitialized=
 values.
> > +            // Use that trick to infer the type of this PhantomData.
> > +            break ::core::marker::PhantomData;
> > +            break phantom__(&{ let value__: $typ; value__.$($field).+ =
});
> > +        })
> > +    };
> > +}
>
> Very flexible and powerful. (I even think this code could be released as
> a new public crate.)

It's probably not _that_ useful in general, unless you're implementing
this kind of reflection... otherwise I would have found an existing
solution. :) But yes, it's very powerful.

Out of curiosity, I asked claude.ai to explain it and it said "This is
a rather advanced use of Rust's type system and macro capabilities to
do compile-time reflection - basically inspecting the types of struct
fields without runtime overhead. While creative, this pattern isn't
commonly needed in everyday Rust code."

When fed the initial comment from the Rust forum it said "your comment
about wanting to access <T as SomeTrait>::SOMETHING for a field's type
is a classic serialization pattern - often used to get things like
type IDs, serialization formats, or field metadata at compile time".
That's actually pretty impressive; the LLM was also impressed and it
started asking me more about it ("Are you building a custom
serialization framework from scratch, or extending an existing one?").

> > +/// Return the `VMStateField` for a field of a struct.  The field must=
 be
> > +/// visible in the current scope.
> > +///
> > +/// In order to support other types, the trait `VMState` must be imple=
mented
> > +/// for them.
> > +#[macro_export]
> > +macro_rules! vmstate_of {
> > +    ($struct_name:ty, $field_name:ident $(,)?) =3D> {
>
> why allow a comma at the end? It seems other patches don't use that
> style.

I copied it from the standard library offset_of, but I can remove it too.

> > +// Add a couple builder-style methods to VMStateField, allowing
> > +// easy derivation of VMStateField constants from other types.
> > +impl VMStateField {
> > +    #[must_use]
> > +    pub const fn with_version_id(mut self, version_id: i32) -> Self {
>
> Why not use u32 (and omit an assert)?

The version_id field is an int in the C struct; you'd still need to
assert that it's <=3D i32::MAX, and you'd also need an 'as i32'. In
practice it will always be a constant, therefore it will auto-cast to
either i32 or u32.

Paolo


