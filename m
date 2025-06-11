Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPKPW-0008E7-4t
	for mharc-qemu-rust@gnu.org; Wed, 11 Jun 2025 08:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uPKPU-0008Dm-SG
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 08:18:28 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uPKPS-0007Zt-Ki
 for qemu-rust@nongnu.org; Wed, 11 Jun 2025 08:18:28 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-60707b740a6so9323860a12.0
 for <qemu-rust@nongnu.org>; Wed, 11 Jun 2025 05:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749644304; x=1750249104; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7uR241IcqfKLYE95UiAd7frDVEkDQ7vELA4thWeKapM=;
 b=pytxGZZyKmbJdaQpVtYosMDFBfWsxigRfxF8lhs8UJdSaI+6foYTpIKg/HtiLAbYfW
 Lno17+XTKFcim0dyu26xS9E538Ffb0U8bBj5Rm1qh8CSq10qgOmkAtZqDFwfiVr9l8ib
 7crf83y5yyibb2NjeyYnO3nCknPjAqX+x1yBZGQU6osawQqzndQphKr2OP8r6Z0JG0Lr
 QdnHC5dFI/eMt6mfeK+MYwllXpgFf+p8y3jWDyAuLIkJKmwHJ36nNxEAUg9DnXPgLHXi
 5qVeyKfBKWg1yKWZG2Cu6DSJXm6KLA8+XuFTMktIkNid71U7WMmMt+fb73cBb5XhFQLc
 I6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749644304; x=1750249104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uR241IcqfKLYE95UiAd7frDVEkDQ7vELA4thWeKapM=;
 b=a4cLMhzB4SUlZWxXGDnqAGlM6ssKM2/Yc73LaIPk3dGHGVDVy89Zrmy0HuDzTgr2VP
 bH/8yirpnlDGzxHMEsMDUkkHzA1KOSthOG5v4bZ423xoNkhHZf6jIJ9NL871tAIJE1qf
 6Fo7SSz1I7xU1KMYqfAg/I1uPuxVwj+g8Te7gW0a5bqP8AodQh+/DFC45E0qFyzpVEyk
 816gHGtSMG+w7PWzftce8eKZljIxKJEVJpC6fHFqJNsG/kH3+LyMFNBwzBg0XE1Y1o/V
 8NA8TUWtCj2gS7ffYSulE+vTvk/xOfWBGgAzx6OVfpoGOkHP6bTFmgVOOmnWjGVNcStw
 zKUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDjXRKML6pQP/ZITaYmdayXjjHmLvi4t7CTe7lqqwi9S5OdFxlSWEj6THsUJvyx1WNcQVjNuq9TjU=@nongnu.org
X-Gm-Message-State: AOJu0Yx5k51oX/1Xmm8bPKE+AG9GCKp3gMSCiFAKsanvhVxtYwX51qtO
 tzEoDWzCG1M8RTi42OPdzvyUG799UMGmTaihQ0rVRn2VWlkIuMQWTcu76j7umsgAoKAXCEgBNot
 LikVp5WIi/PCX1P9+P7HzFzOMGqr15fK24bQmSjAD3Q==
X-Gm-Gg: ASbGncvfL9W2MDL1NzoJ8maouJzDQp5NJ4qIPAV6S9xcvhv2/OQdv/8Q0GXdLQXIBey
 vBxuvw3G530sd0bfTdx5PwQG5CUoXh83LB/6lrO5pBgpgVaCJMpIV8O3A9pa4L65F1iww5c1TtK
 S3jXSm96Xl0T8AvWq9XM1nn2Ew2zKbsFPLGwRytsNdCL/55OUxrcSm
X-Google-Smtp-Source: AGHT+IF2capRDFDndMArNWrti0+WDfXgpWYmKKQ0Ne3/64MicG+Qwx4TaHRmT7NNhyArjcAT8ZWSviQD7eqC+meljVU=
X-Received: by 2002:a05:6402:26ca:b0:602:225e:1d46 with SMTP id
 4fb4d7f45d1cf-60846abeda9mr2956769a12.3.1749644303823; Wed, 11 Jun 2025
 05:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250610202110.2243-1-shentey@gmail.com>
 <20250610202110.2243-2-shentey@gmail.com>
 <CAAjaMXbtcyB3J3AvGh8ZW3MSi41uMaE+TkZwipCs5pg6wvYJ=w@mail.gmail.com>
 <CABgObfYgoYBJmZjin_Wj8JeEviFMM+vFa_QX_8Np+1n9apq4kw@mail.gmail.com>
In-Reply-To: <CABgObfYgoYBJmZjin_Wj8JeEviFMM+vFa_QX_8Np+1n9apq4kw@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 11 Jun 2025 15:17:57 +0300
X-Gm-Features: AX0GCFv1eTdqet1u8LBX8UHVvFtF6ksoPXLe1jeXIpf405FnKWGyJx8sLJB--F4
Message-ID: <CAAjaMXZ5S7GUPmhwxsyuVmF4tvUh3vgjnK8OLKv-A+h7JCPqBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust/qemu-api: Add initial logging support based
 on C API
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Wed, 11 Jun 2025 12:18:29 -0000

On Wed, Jun 11, 2025 at 2:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> On Wed, Jun 11, 2025 at 12:57=E2=80=AFPM Manos Pitsidianakis
> <manos.pitsidianakis@linaro.org> wrote:
>
> > Maybe we could take this chance to remove the requirement for trailing
> > newline? Not urgent, and also something we could change afterwards
> > anyway. We could also introduce log_mask_ln! macro but now I'm just
> > bikeshedding.
>
> Good idea; there is no "formatln!" but I think you could use concat inste=
ad.

I think `let formatted_string =3D format!("{}\n", format_args!($fmt
$($args)*));` might be sufficient, but I haven't checked it myself

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

