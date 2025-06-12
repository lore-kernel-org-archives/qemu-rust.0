Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPduu-0005zz-Jx
	for mharc-qemu-rust@gnu.org; Thu, 12 Jun 2025 05:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPdus-0005zY-0e
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 05:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPduq-00014b-6f
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 05:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749719286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zbcMrrIPcCkuUx3QPLQAk4IfNXL0oqnM7npn3lylVjw=;
 b=Kz2oUv3PLLION3AFbQ7amhytVzNK/9wuS2jkIomtS0rBidMnIjGlqUV7HgRzuT9XxmItK1
 0DW70+giUnptqqGtR+lYu+YvlLhyDKNIYMjOYM285ewTPhMHrhIL5bSuzyLl28czFD3dCG
 NDLiCaXfkJUypp3W0HBEpVu9+RmcafE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-nOWciHBDNTark5N4p9eEIw-1; Thu, 12 Jun 2025 05:08:04 -0400
X-MC-Unique: nOWciHBDNTark5N4p9eEIw-1
X-Mimecast-MFC-AGG-ID: nOWciHBDNTark5N4p9eEIw_1749719284
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f8fd1847so266769f8f.1
 for <qemu-rust@nongnu.org>; Thu, 12 Jun 2025 02:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749719283; x=1750324083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zbcMrrIPcCkuUx3QPLQAk4IfNXL0oqnM7npn3lylVjw=;
 b=cEOpuMhG+NiSSkJesIl9a5hClfSGJFmbeM/j8iSjxt7CcsOvSv95LqPRfbRyD9rbGp
 5H+PMhsesdpZ9S6+nI6CTcYn07lxhXOc1rN02Icrk+kif4qeKWPUcl65BrNscCoXXGIv
 xoJ98aL51Mawr2k2O9VXueMTBQ8lMZ+3CAG8zSjw/X9wU7CFIgFAu1XoOdATxqCYWMWy
 7fuZihClHhJ2wUTNkb0vKMyUDjOFJWdndptxb93phJ+HR13t+k19Lgy8BV/6w3uKTSeQ
 UPWCYJ1j+TUGo5oxe40ysww9V+Hj1/eP/7Dlhm1sjj7I+aaLXCa8/9T9E0K6oODwdE23
 q3Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyoKbOemeBjhxgTvM8XiWbutaYoPvnUNniqkkXJ/n/ghuwP3LpLg500p59rM2CJlDDViihNIyUCgY=@nongnu.org
X-Gm-Message-State: AOJu0YyFtPOfEYzjWoxKBI4xznWFQfpI87s2dvxVLTlFZEFkproraOCC
 Y4SLZ+DvVxLOyXRdgZnNNGWUPQt1qktjP10SOtH2eCFJ4ic6kZJiQ+OYQuLM3Jj+NV5nel6PxQ8
 ak0g5jG+p90uSnCtubYp0bpBjc8DSYiLL6f6rmRYYFo/zpSTkvpOlUqiOivTOXpD5bfgCHbiI9o
 wIgz7+HmbO+Ctv+0WC6e2tJmAsaQPqlw==
X-Gm-Gg: ASbGncuCW+5HLJ2k1bssaDYWFxlmWTQmLpr1NrmS5Uy5JKANpdzs5ygQ9VVFCLa2BIt
 u26ktlowWfpiFvOO+TjYZBrwHD6UfyXtcC0JJt0JHz2iMWIfcldQhw7odVwdTelflAmJ73ioX84
 yQnOU=
X-Received: by 2002:a05:6000:1a8b:b0:3a4:f8e9:cee0 with SMTP id
 ffacd0b85a97d-3a5586dfe01mr5205011f8f.40.1749719283492; 
 Thu, 12 Jun 2025 02:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2fh/xY/0jl8G3zBet1JSkGC7kU+gMY+uEx0ZKa2UrXhIgqlXKsfP3G/VkOd+eUVzEMVDXUfge7qY2tc+yZX8=
X-Received: by 2002:a05:6000:1a8b:b0:3a4:f8e9:cee0 with SMTP id
 ffacd0b85a97d-3a5586dfe01mr5204980f8f.40.1749719283112; Thu, 12 Jun 2025
 02:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250609154423.706056-1-pbonzini@redhat.com>
 <20250609154423.706056-5-pbonzini@redhat.com>
 <aEqcGiGmZiMoIhY5@intel.com>
In-Reply-To: <aEqcGiGmZiMoIhY5@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jun 2025 11:07:51 +0200
X-Gm-Features: AX0GCFv6QVVNJhmqAdTb5KqbCbq6FYLTVpEMbhlGyDhcwIdHbY6CTrrdmHvbqsU
Message-ID: <CABgObfb8CWy5zthqHRJrKqjP4xmBC=Zh3FrDjcK2Z6wsZJu-ew@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: qom: make ParentInit lifetime-invariant
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o4sOnokkmIDSrTvUJL8AOvggDy_krq3qAdyeBLw6NX4_1749719284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
X-List-Received-Date: Thu, 12 Jun 2025 09:08:10 -0000

On Thu, Jun 12, 2025 at 11:00=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wro=
te:
> > +/// It's impossible to escape the `Jail`; `token1` cannot be moved out=
 of the
> > +/// closure:
> > +///
> > +/// ```ignore
> > +/// let x =3D 42;
> > +/// let escape =3D Jail::with(&x, |token1| {
> > +///     println!("{}", token1.get());
> > +///     token1
>
> This line will fail to compile (the below comment "// fails to compile" s=
eems
> to indicate that println! will fail):
>
> error: lifetime may not live long enough
>   --> src/main.rs:22:9
>    |
> 20 |     let escape =3D Jail::with(x, |token1| {
>    |                                 ------- return type of closure is Ja=
il<'2, i32>
>    |                                 |
>    |                                 has type `Jail<'1, i32>`
> 21 |         println!("{}", token1.get());
> 22 |         token1
>    |         ^^^^^^ returning this value requires that `'1` must outlive =
`'2`

Right, I put it there because '2 lives until the second println!. The
problem is not so much that it's returning token1, it's that the
println uses it.

I can see that it's confusing, maybe:

    // Because "escape" is used after the closure has returned, the
    // compiler cannot find a type for the "let escape" assignment.

Paolo


