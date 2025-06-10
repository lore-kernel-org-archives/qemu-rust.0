Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uP1em-0003nC-CU
	for mharc-qemu-rust@gnu.org; Tue, 10 Jun 2025 12:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uP1ZD-00033f-Vg
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 12:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uP1Z6-0001es-V0
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 12:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749571862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lw4KCgn5AuZvkE6iDhSORyprWcfTe4OMDLQGuKVdJ68=;
 b=K/JPED1DWreLh6dNLi1Ky/KwB86/2PlF5N0I/zKkUZNOTtwG1XKB7dyZRuRLrMMu5K1qCR
 DRFNjaXSrONTHGbIDzuMovjEkYku4/oljRmjNzSjqnijojmdGNndqDjY2KKYpjdN+IAzBa
 cxXIlfdRmP2xYnN8JBUTpxUac1MTvlM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-wGkEtXhbPbOWaMlVZ9xsdQ-1; Tue, 10 Jun 2025 12:11:00 -0400
X-MC-Unique: wGkEtXhbPbOWaMlVZ9xsdQ-1
X-Mimecast-MFC-AGG-ID: wGkEtXhbPbOWaMlVZ9xsdQ_1749571859
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a54a8a0122so1046415f8f.2
 for <qemu-rust@nongnu.org>; Tue, 10 Jun 2025 09:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749571859; x=1750176659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw4KCgn5AuZvkE6iDhSORyprWcfTe4OMDLQGuKVdJ68=;
 b=oRVhOhdIuFuBUiW75PkJDgK9IuVEDFJyx/o4Z7SSVM2Y6tLW+vmvyo+2v5hfZ+m7qT
 xVVPh+yV+nXvIZvwW9AFRQTlEYnsBoDKhaz5nEsUDwR7UhrxCGfb3Ez3o1ajJMXdI33L
 Z+ForolzyjC7jAC/V63PmL6zeVS7Fd988j6BclBQl8MVKvRTf3EdUkQxL+AvZwdApRcS
 kx6kB45wODEHrYhtA5KlZRC7iozmfxkzietgD4/UuLlOi/wwveS/UwN5Q5Wpxxd8t1MD
 /4DxDrLJ/qQmwF5+ZoKz1/A1xTB9OIpHR0NrqKPXSlIV7ZB2mnaMfyXWzAu7kj2WQZFC
 i+WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6mIPUzKwsZwaFGjIbQ8x/QNFwVAMlB3ZPuwEfH3snTJmVad8WKwyBTy/2LYI08fYJbqbDRKeUbhY=@nongnu.org
X-Gm-Message-State: AOJu0Yxp2V3ec8jfFRA60H5kL66U39zb5ZHSwrwcbyIYIAYXp6f3y6Gw
 pvE0Mn7Dg1dq/qLVd6AS6WX0/S1Z2Vf1jdoDWIyphFA1pmqsKeDft4A1OROa1rmOnOtFJClRy7b
 cv1q+ivyoqFWBQOHGHg8e40LtolqAVWKEVvsQApjQ13y3azrKHbJaQaZrmEGmVsPoRlEWFosm41
 5au9D64QP+UVhdP+8Be001SIrDSb/HAg==
X-Gm-Gg: ASbGncsSLpDMbEumZjbCq1KLZS+htiyG8VjwWyDS6GcrI0KKpNXL4IBMOStTRsGbY8m
 l7+VBHyzg+DmtnxRU22yOHs08Xo/jz06q2i184JSEINiNf/BM71shNMxUZA25VPTELvngRHatUp
 5+QQ==
X-Received: by 2002:adf:f58c:0:b0:3a5:39d7:3f17 with SMTP id
 ffacd0b85a97d-3a539d73f90mr9784000f8f.47.1749571859471; 
 Tue, 10 Jun 2025 09:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rvEMsKyQJ+gIF14zjTJ0VBycm1tLlvb9Fi2AQvxcIw7deQAd1I27kyWkq0ZOiMcEThd5tumYH8vB1D0U1VQ=
X-Received: by 2002:adf:f58c:0:b0:3a5:39d7:3f17 with SMTP id
 ffacd0b85a97d-3a539d73f90mr9783966f8f.47.1749571859026; Tue, 10 Jun 2025
 09:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <CAMxuvazN2OMc1VANJVMgj0nQ1KCCop46A151uAUe0mdATrQjCg@mail.gmail.com>
In-Reply-To: <CAMxuvazN2OMc1VANJVMgj0nQ1KCCop46A151uAUe0mdATrQjCg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 10 Jun 2025 18:10:47 +0200
X-Gm-Features: AX0GCFsdiMxgV9drCac9melcjaVIHtck4Y6vTQFlL7mrYgE6AYChETUHOZm5-z8
Message-ID: <CABgObfYt=Gg=R6cekCTbYhmF+2P-9DoOCSeaaWHHGbMmew2ZyQ@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] reviving minimal QAPI generation from 2021
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com, 
 mkletzan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pkwiWmDc6IP7CNsrGreVdiGmzcHaKCrOLeXJy-ESmbM_1749571859
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 10 Jun 2025 16:11:16 -0000

On Tue, Jun 10, 2025 at 3:53=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> On Thu, Jun 5, 2025 at 2:11=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
>> This is just an extremely minimal extraction from the patches at
>> https://patchew.org/QEMU/20210907121943.3498701-1-marcandre.lureau@redha=
t.com/,
>> limited to generating structs and enums from the QAPI schema.
>> It does not include them in any crate and does not compile them.
>
> Do you keep an up to date branch for those patches?

I can add them to my rust-next branch but they can in theory just be
applied to upstream/master.

> I fail to understand the advantage of going through Serde to deserialize/=
serialize from C when you can have C types in Rust - having less generated =
code?

It's indeed trading generated Rust code for generic serializers and
deserializers + #[derive(Serializer, Deserializer)]. It's not the
primary reason but the size of your code generator patches was a bit
scary indeed and I don't want to inflict too much review effort on
QAPI maintainers.

But also, I'm not sure that the C types are needed at all for
implementing QAPI commands. The QAPI command generator could have a
directive like 'rust': 'qga::qmp'" directive (or maybe just
'language': 'rust', I don't know) that would generate Rust
marshaling/unmarshaling functions:

pub extern "C" fn qmp_guest_get_host_name(
        args: *mut QDict,
        ret: *mut *mut QObject,
        errp: *mut *mut bindings::Error) {
    let args =3D unsafe { from_qobject::<()>(args) };
    match ::qga::qmp::guest_get_host_name(args) {
        Ok(ref v) =3D> unsafe { *ret =3D to_qobject::<GuestHostName>(v); },
        Err(err) =3D> unsafe { err.propagate(errp); }
    }
}

and this (more specifically from_qobject/to_qobject) could also use
serde, this time to go directly from QObject to Rust and back. A
QObject serializer/deserializer should be easier to write (and very
similar to existing code in serde_json for
https://docs.rs/serde_json/latest/serde_json/enum.Value.html), so you
could reach the stage of your old posting with qapi-gen changes that
are little more than these two patches.

> I also do not fully understand how that would work.

To be honest neither do I entirely. But what I understood is that
Serde is based on a visitor API that is very similar to what we have
in QEMU. See the above serde_json link where it implements Serializer
and Deserializer, and the blog post at
https://ohadravid.github.io/posts/2025-05-serde-reflect/ should be a
good introduction too.

That said: the *possibility* of using Serde is why I started from the
native structs. I'm not wed to it and generating/converting the C
types remains a possibility as well.

Paolo


