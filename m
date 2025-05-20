Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHJjl-0006Ve-2Z
	for mharc-qemu-rust@gnu.org; Tue, 20 May 2025 05:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHJjj-0006VO-BZ
 for qemu-rust@nongnu.org; Tue, 20 May 2025 05:58:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uHJjg-0007kq-TQ
 for qemu-rust@nongnu.org; Tue, 20 May 2025 05:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747735090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceUj7NohcwPuRcEJq3YphgLsVLmuYSeM5JaLNINpgUM=;
 b=cly62LqucEtXgd34OM/UeT5cLOSWFuAHwpLCqxGv9yZ2583sEF0X+ferUO8NZDAw51FIp+
 XaEFdmCvu39TCjtw/fSg/fJg6eQV+1jPw1UqbgftgPmRZ79O4kXYBLNwOJAvb4BxswWXdY
 o8I62ZDqkpPqmZQeUnaIXnexXmdZsVE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-6ItCYLpxO8mHBLZe_9u4aQ-1; Tue, 20 May 2025 05:58:09 -0400
X-MC-Unique: 6ItCYLpxO8mHBLZe_9u4aQ-1
X-Mimecast-MFC-AGG-ID: 6ItCYLpxO8mHBLZe_9u4aQ_1747735088
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a379218f6cso331457f8f.0
 for <qemu-rust@nongnu.org>; Tue, 20 May 2025 02:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747735088; x=1748339888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceUj7NohcwPuRcEJq3YphgLsVLmuYSeM5JaLNINpgUM=;
 b=vXQ8jGZ3BnJJlcwv8uTYro0dX0acm2JVF89mCU8bxm0+g9YEF7eRV0shWCMvskRCcU
 v6dc/y88f4F0KkvlsjQ4TPh43KAX9gbcXuifceNRGVqS2yp4VarxvLotlN1t4Ucaal6Z
 lgkNH8TQRmpFrnT0rIb78xLbWhhAWE+X3ePAO+c7FXJnV7kYCyYBmGuswdGowE7QpoAr
 +UgSJ4ebKdNHVxT6Dnu1XJXjvGLi5RAl8pEEU9UFPEPCWe/ZN199+hs0foH6jNKb5pEB
 2tE04Z6a79JSgvgf4Y7cndsQx+c2w5kS6mYixvCu6+uoYH9LsHyslQm4VOloaL6+heCH
 kgZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0rTuqklDzO/9K7Ma62VRJmMGNYAo4B5IvOaSwPrC/hozkkt3MR/Ymjyax5po4Rat8fI/BVaHNa88=@nongnu.org
X-Gm-Message-State: AOJu0YyeOXTj5A0DrMfDjVkwiIiO8WPoPsDqskTcF2MYurpbIg4mipiV
 sS2rv3xGz+udaLvpgdgD9tSuFBR0zlmRKrZACgYfoUjY4n0vv5wRuphBWOHpD/TVuWxqxPaWQwr
 zXLQEJ3tUomKDfPJJd2jD/vqFnwFNYCR5jOg+rt0hTim/2ZAamdNcWCS86XzmFLHUj/fNQsI28v
 K/SD0XYVeIfYdGiX3ze5rsTGMuWYRb4g==
X-Gm-Gg: ASbGncvYlxE3OxXvPVDhBzdIB8cUxP/dIUeDjtsy3vNGrGmO4jDTcm2oNbSEdYJ+agU
 5yW0On4+kDpLQKQpuRkP478Vcieiv6cSjT7YBR5xnbt+hCS4fYkTod0fT+BuS+P2mvFE=
X-Received: by 2002:a05:6000:2912:b0:3a3:7cbd:39b1 with SMTP id
 ffacd0b85a97d-3a37cbd3a4amr369904f8f.24.1747735087784; 
 Tue, 20 May 2025 02:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO55mrXXsOfP0kIppOkKfntLa3RW7DgdoF+8rqOhOgpd8IbnIPqTWaU8BLWAF3TJRsFqDye2CHVwLB54j/WpA=
X-Received: by 2002:a05:6000:2912:b0:3a3:7cbd:39b1 with SMTP id
 ffacd0b85a97d-3a37cbd3a4amr369878f8f.24.1747735087341; Tue, 20 May 2025
 02:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250330205857.1615-1-shentey@gmail.com>
 <20250330205857.1615-2-shentey@gmail.com>
 <340649cf-9348-458d-97e7-aee73c02217c@redhat.com>
 <540905F9-7DF7-436F-905C-A7F225F5E156@gmail.com>
 <CABC6E67-C4C7-481F-BB96-BF60957D7A84@gmail.com>
 <CABgObfbD-yHee4TXKqQ2gw7N8dtuB1wKqPLD5jLKXtJ8hx2xSw@mail.gmail.com>
 <CAAjaMXadSaKKAk6Vo-AM8RfkH3kQey9LamjC=nEDkYF0d=v47w@mail.gmail.com>
In-Reply-To: <CAAjaMXadSaKKAk6Vo-AM8RfkH3kQey9LamjC=nEDkYF0d=v47w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 May 2025 11:57:55 +0200
X-Gm-Features: AX0GCFvgEfSNrUc0UMVgSAvjorMVsU5D_ePX2ucQPo6cwhJWHsiWtqYdj00rbEI
Message-ID: <CABgObfbbuPoQZPYxE+ZQYd=WpLX=zkXiWYOqoAN6MFaX1dx7wg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/qemu-api: Add initial logging support based on C
 API
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VQu0wR7n1RcGB_THjSogsFvZc5l7MaBohFPF19U5KPs_1747735088
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.13,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Tue, 20 May 2025 09:58:15 -0000

On Mon, May 19, 2025 at 10:14=E2=80=AFAM Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
> There's also the `tracing` framework
> https://docs.rs/tracing/latest/tracing/ that is quite nice for
> defining tracing events **and** spans for logs. I find it confusing
> that it still ties tracing events with log level filters though
> (info/warn/error/debug/trace).

I like the overall look of the tracing crate API a lot. One thing that
I don't like is that it's very string-heavy. In general it seems to
have more overhead than tracetool if you use `Interest::Sometimes`; it
uses Strings for event names and targets but not ids (the default
event name is even "event FILE:LINE" which is not really usable except
for development), making matches (especially "enabled()" checks) slow.
Secondarily, built-in support for fmt::Debug/fmt::Display lets you get
away with not thinking of *which* fields you want to record. But it's
powerful, easy to use and it also has very few dependencies, which is
nice.

> Perhaps this is also a good opportunity to restructure QEMU's logging
> in general. [...]
> If we align QEMU's general logging to use log levels, we can convert
> guest error logs to "Error" level logs of type: "guest", and unimp
> logs to "Error" logs of type "unimplemented". Or, "Warn" instead of
> "Error". Then, all trace_* items become straightforwardly Trace level
> log items.

Focusing for a second on guest and unimp items, do you think that
there would be macros like `guest_error!` and `unimp!` (similar to how
`tracing` has shortcuts `error!` or `warn!`)? If so, we could add them
even now, so that any future changes to the implementation would be
transparent.

> Then, all we have to do in the Rust side is implement a `tracing`
> subscriber that consumes these traces and pushes them into QEMU's C
> implementation.

As I said above, I am a bit worried about performance implications of
having Strings for event names and targets but yes, using the tracing
crate is definitely something to think about! As you say, it provides
an opportunity to add structure to QEMU's logging and maybe we can get
the best of both worlds from both `tracing` and tracetool. Do you
think util/log.c could become a wrapper around event!() and
tracing_subscriber::FmtSubscriber (with log levels based on LOG_*
constants, as you mentioned)? Then the `log` backend for tracetool
could generate Rust code that calls trace!() instead of C code that
calls qemu_log().

Or you could do the same thing to the error_vprintf/error_printf
implementations, and then Rust code could use error! and warn! where C
code uses error_report() and warn_report(). It's a common complaint
that error_report() and warn_report() get lost in logs for example,
and `tracing` could add some structure there.

It could also be a very good starting point for thinking about C->Rust
FFI (i.e. implementing in Rust functionality that is used by C code).

In the meanwhile, another thing that could be done is take inspiration
from the `tracing` API, for example adding an #[instrument] macro to
qemu_api_macros:

impl PL011Registers {
    #[instrument(target =3D "hw_char", name =3D "pl011_write",
        fields(offset =3D offset as u32, value))
    pub(self) fn write(...) { }
}

This way, even if tracetool and trace-events file remain part of the
architecture, the API is more familiar to Rust developers. It'd be a
nice addition to Tanish's work (he's my student that's working on Rust
tracepoints.

Paolo


