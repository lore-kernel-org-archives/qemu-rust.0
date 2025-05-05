Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBsCV-0008Vk-Lf
	for mharc-qemu-rust@gnu.org; Mon, 05 May 2025 05:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsCN-0008RN-GI
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:33:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uBsCL-0002Mz-Of
 for qemu-rust@nongnu.org; Mon, 05 May 2025 05:33:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5f4d28d9fd8so5688972a12.3
 for <qemu-rust@nongnu.org>; Mon, 05 May 2025 02:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746437596; x=1747042396; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sd/v2WYjc9w6KMnrFySOsz53NEbusViE/8eibloBnnk=;
 b=XYlOulBgmGAwSv5BdKqfk7gTlyaNJWutF4fnrFAlROkmsLwBKOusfjMKjcPi/PoSlF
 xnDGhtkoL01K3edMl5Mxqm8cJvrbCJmvgzlkKUhfgxo68y38LBe0kJNc4+brrrlBnaqe
 wBsSewRuvLryp2+ofh69QMcHdsIb/Cl7XBTdxqnp5XNIYUsQlo67ch+Irsgf60ZuAQpP
 geZRkYoRCWRXOALmXn6p1PVxJkqEA+1xea5vfxQYw48siCn7DTye3uhzRaqGMZf444US
 DJ71CcyOBz65xhMWaZSX0V7jAxUb4ufs8hpf/1PB2xxb4eeKg+1l29PCGYO31tFCOkv9
 aNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746437596; x=1747042396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sd/v2WYjc9w6KMnrFySOsz53NEbusViE/8eibloBnnk=;
 b=UcjfcGTtHJY7wZ7jF/pLXcoZ0IyXBRYVFvW/Clx6Y8AgjUa1rmapY0bk02iCQRqsur
 wZl4FsPu6ziNmzNCJ3SRiRq5DcN9kFwL2pGztTcrQKlDA+FexVkgL+mhqYTu0kDlHOex
 M71sRUipeFerCfhRLELPXKVts9/lo1J6eo+UnTh277+yVVclaiHSmduwxlfZvNAnqJfL
 uz7JR8bon6VH1PDsNkzv4zfFW20mvgxJw5tLXBRlu/MzGthqMVfHJ3YUG32k3cNiprjL
 HfIzfle0hMHul7eSYTyAJPIwa6hWczFDdwexd6/CRt1iR+XYnoNKiQqg861NMzudzN+d
 hjdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5AvmQLbmQdiaElOHMzOcyEiri+rwlgLQHj4+Ut+aJkrDhQeTbwdw0IzvyEvDL9tg8ZkEyjTAaaXo=@nongnu.org
X-Gm-Message-State: AOJu0YxU0+EUoPmTQUDmsEYHQTHL7ymfPsKJrwhMHbBjYojBsv9yegfQ
 yNE5hwyLuVpNU8PqSNnN8V/ISdWdULoMUOMPIm5Onw9NbGX7MXsmLPvKQpFakZjow8mDDYSSfdt
 fJRndxN54L8UAmMNYz7InpEwL7Gq6vwCeelk5m7h2YcCHqGaHHHSqaQ==
X-Gm-Gg: ASbGncvj3fUskpi9+XwROeLK5VZ510LMhmcopeeZT0v36DcZu1A77jer1wbZv77GiDJ
 Oz6Pf/mb1+iRrCW7kOb5KIDaf3f44T/lUJa6yBJ/rFteSN9YOHWDW0mk7u1/5kY/5148w9OBAnA
 M4zMRCnizIOzWldGLJN8zL
X-Google-Smtp-Source: AGHT+IGbSPA/dJD2B9g4aPqola3nCvMpIZAMEZrFb5xyy1ZnN8VHY54ueXIRkwZLMCFAMfWQW2D2/1InjEsIgkz5/C8=
X-Received: by 2002:a05:6402:1ed1:b0:5eb:c90f:86ae with SMTP id
 4fb4d7f45d1cf-5fab056f0e0mr6175569a12.7.1746437595909; Mon, 05 May 2025
 02:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250505090438.24992-1-pbonzini@redhat.com>
 <20250505090438.24992-8-pbonzini@redhat.com>
In-Reply-To: <20250505090438.24992-8-pbonzini@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 5 May 2025 12:32:49 +0300
X-Gm-Features: ATxdqUER8aitTLiUSbvnlDioiWXSAwhFAgRhNDNcw5d9suLRXYAojj_oOHtf4ek
Message-ID: <CAAjaMXb2Qqx2=M0tf4yEpYx_TMyfWGJ55hBDO4SQLArr4Ws3zQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] rust: qom: fix TODO about zeroability of classes
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 05 May 2025 09:33:20 -0000

On Mon, May 5, 2025 at 12:04=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> The proposed suggestion is not correct.  First it is not necessary for
> *all* classes to be Zeroable, only for Rust-defined ones; classes
> defined in C never implement ObjectImpl.
>
> Second, the parent class field need not be Zeroable.  For example,
> ChardevClass's chr_write and chr_be_event fields cannot be NULL,
> therefore ChardevClass cannot be Zeroable.  However, char_class_init()
> initializes them, therefore ChardevClass could be subclassed by Rust code=
.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/qemu-api/src/qom.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/rust/qemu-api/src/qom.rs b/rust/qemu-api/src/qom.rs
> index 6929e4d33ae..52e3a1ec981 100644
> --- a/rust/qemu-api/src/qom.rs
> +++ b/rust/qemu-api/src/qom.rs
> @@ -534,9 +534,10 @@ pub trait ObjectImpl: ObjectType + IsA<Object> {
>      /// While `klass`'s parent class is initialized on entry, the other =
fields
>      /// are all zero; it is therefore assumed that all fields in `T` can=
 be
>      /// zeroed, otherwise it would not be possible to provide the class =
as a
> -    /// `&mut T`.  TODO: add a bound of [`Zeroable`](crate::zeroable::Ze=
roable)
> -    /// to T; this is more easily done once Zeroable does not require a =
manual
> -    /// implementation (Rust 1.75.0).
> +    /// `&mut T`.  TODO: it may be possible to add an unsafe trait that =
checks
> +    /// that all fields *after the parent class* (but not the parent cla=
ss
> +    /// itself) are Zeroable.  This unsafe trait can be added via a deri=
ve
> +    /// macro.
>      const CLASS_INIT: fn(&mut Self::Class);
>  }
>
> --
> 2.49.0
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

