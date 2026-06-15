Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE16CD98DA
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Jun 2026 09:29:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wZ3co-0004f0-US; Mon, 15 Jun 2026 05:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ3cl-0004e8-DW
 for qemu-rust@nongnu.org; Mon, 15 Jun 2026 05:28:56 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ3cj-0002cO-G8
 for qemu-rust@nongnu.org; Mon, 15 Jun 2026 05:28:55 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-66061993121so3056637d50.0
 for <qemu-rust@nongnu.org>; Mon, 15 Jun 2026 02:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781515732; cv=none;
 d=google.com; s=arc-20240605;
 b=FHvj/6JPN+dRRsrr2csl3Rm9qs9ENPRtAR0XalnoR1nJJO+blSyE2DWzznFliOqatY
 T6OgPjB4L2a51GBBYO3YEe8A13p7Ka2c+a0gCbB50r1pC8gvRpen2P0Gw6rQSm2xvS7S
 kPgvTzpiYviqD+iMmQdC91yoHgJXPg1Si6fpCKddfn8LLeEGqC/57pUF05hqEgb4Ii+t
 +b8HSMHxToIIy9C9xShn7EFXLTvteDOf58g9YFzC5u8a/vyE+nzou0OsFWNpNI+H77s/
 +dezekRhP7NKhQ2Xe92h9Wbc0U4Ddxba1v87oaPSBen7bY+Mq+IsBPq2CXhRklz8z66X
 BdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4h7z8wlbabOPsROrERBqjgdjxedmv9sWmTQBMTR5gyk=;
 fh=llnEwRWF2RA7Qz/6NwgVM8xuM65YjuVEsXi64A8QCCU=;
 b=LuNQEXeBYWi/K9/62Gcx40Cy1u5f+R7wKPub6O8LD2v7sBFnIHo7MwDMOH08j/5NM6
 8ag6YOmhquUNHMShwLqwowU3wVaOlJoISdffsRujAPtP9SJZAStQyJNOcEhTCpD2dOVl
 qrz60FYjzqVXQOjVpw6KrqbUllQqDvmWj0QJmRJFmKizEdGuH/4nRQDS50DBBFvOW5U5
 Tjue2l6Gohr1CpYAOuhjd86vmkSbaFgvvLg42onlJOsZNrJcfcidxMnzttps6KX4wDjD
 mfdoD1JVu90fdtlgMQvlcM6wK3qQVd1RE4dMAnUNggoQWd811DtdQ0+40fFh8X/SgKvv
 IQaw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781515732; x=1782120532; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4h7z8wlbabOPsROrERBqjgdjxedmv9sWmTQBMTR5gyk=;
 b=T9rJWt/6Nccx64mv9ugHg60E7DTUfUc+ikir4/1s69/7U8pBoznbbjEx5jXF+cHsrI
 GT4kTKp72TZbVu2HSbIgSXdsWmRuXoqaUwcBb1WAK7aESmULe5+ySwuMiLpeqOcWAUmO
 lTdZmU4MuTLQRphgohsdOlgsCyxMq7YeU0HETVXLJ8vNX44a5zBLXlne0jp6WIDPM9Nf
 CQa0f/bv1/CyhaABpnyQu1wcJ9MYdIW33i347xutH/WrcV6vCu2gu0xZ8kxs3NYNBPCM
 OqVh3sm2TYXT3z+7UzT3GEIX8bOh3tTQgVJpfQYovQwzMqMB/ejR9of9rqMP4FEfISCp
 qnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781515732; x=1782120532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4h7z8wlbabOPsROrERBqjgdjxedmv9sWmTQBMTR5gyk=;
 b=AiudIX5oljNnShrCWPRlUynZ+kfIpqEdcO4hwwSC5HqWMuENZ+S9944d9Njmd1BuoL
 qXUcju29xVAdqnFzn4Q09eRO0/VPwsVTq2XWL5bZd/xGSlhww38CiT5bY+mkVadexzor
 1htig+5cYkJ8zsNjoxmuuTjW6GRlAXTl1Nq42hHz9TG0R9R8jKjIOncipFqbNhnxVtoI
 GegvSDAFb+VABgf0MOrGSOTDU6YaRMZXzw7UhqQtip4H8BbomJQc6mjCdvxbKynvV2qy
 e0dANHcXRgGgmKU1pbuTqQfRTPG1O6clF3e/YA4DatAuqvioyIwYhQvctAIlrv3vBc3j
 8qzQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Rumbtwu8On08zY/iFdZw3tmEhKspa7H62GiNd4Z9cybXYGoScZJ+5uc9tvsjlD7gt9Lf9ZWS1h0g=@nongnu.org
X-Gm-Message-State: AOJu0YzX5KhqUIUl/VNqGy0EMA97bTWX0eX9ovoPCeY2pkkI01utSAAr
 3H4/k8G2i7Eug5zIkcOuZpDOaEpuhwyb2QKjPh7+W6rtaPc/9lRC0pkkzXjBlrIdMzsK3MZTAVd
 s1FkVCbTRig4O0HSWyAXcuI4nUrmpLM5+xftCF32aIw==
X-Gm-Gg: Acq92OGHhbDHiBc87nV8ol+eaJUdVdvutlEh1zSbo/cJaXxoIMimgBHOLFcgpoozxRr
 oaviptE3Vw6cCD5b8bsIfoXNwvvV99SY9VOEKmKSPFyvtB1lSGk9nzVB+H+8TVuGCGRVBU8hchu
 7uASmAx8yBaX1HfloVRzXa12mtqCRHmww37QU3Yek3HdBIArObl45hpgi6KcV5Eob1ri8Doro4n
 +gcpRyAuJENOVvwUZElfgKV1fNvPtyB+V6uU8+zMoScysLhKHWidhh/67PooFs1eIn2fUXE/vsu
 o7jpja5dVnWQid2FDLzhmemSTKZ2Wp5r+m0I1uQYWc3ga/fpLAjtzkd42yGPllKVR2o=
X-Received: by 2002:a53:c146:0:b0:660:60a9:2b33 with SMTP id
 956f58d0204a3-6628500a341mr6854412d50.53.1781515732085; Mon, 15 Jun 2026
 02:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260615-embedded-v1-0-bb0c65bf126c@rsg.ci.i.u-tokyo.ac.jp>
 <20260615-embedded-v1-2-bb0c65bf126c@rsg.ci.i.u-tokyo.ac.jp>
 <ai-z14dMCK33_pis@redhat.com>
 <CAFEAcA_nFiQyXyCuvwUrJ+-0fhmGoMfswK-+KsZbxahAGatTXw@mail.gmail.com>
 <ai-5M6FF7CoJc_re@redhat.com>
In-Reply-To: <ai-5M6FF7CoJc_re@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 10:28:40 +0100
X-Gm-Features: AVVi8CdPDOOgY6peJmpRd_1gRW_mhJwrpEF89DFQaVrdM0fasteTMnuqucjkq8E
Message-ID: <CAFEAcA_52oFGv7cC11jbpj9pwBq-x2O-R_aOGkYzaRWW7t-K2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] qom: Manage references to embedded child objects
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 qemu-rust@nongnu.org, Peter Xu <peterx@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Mon, 15 Jun 2026 at 09:35, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Jun 15, 2026 at 09:31:36AM +0100, Peter Maydell wrote:
> > On Mon, 15 Jun 2026 at 09:13, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > Do we know how many examples we have of embedding objects inside
> > > another ?
> >
> > It is an extremely common pattern for device and SoC model
> > implementations; we've been recommending it for years.
> >
> > > I would much prefer if we forbid the embedding of objects. It is
> > > horrible design practice to have some QOM objects which can be
> > > freed via reference count and some which cannot.
> >
> > That would be a very large amount of code to rewrite to the
> > new paradigm. I don't object inherently ("you have pointers to
> > your child objects" works better when they might be implemented
> > in Rust and might play better with being able to create
> > machines and wire them up on the command line); I'm just
> > noting how much work it would be if you wanted to make
> > embedding forbidden.
>
> Would it be a more tractable problem to "fix" object structure only
> incrementally as they gain a need to be managed/reference from
> Rust code, or does the Rust usage already implicitly extend too
> broadly

At the moment we have exactly 2 Rust devices. You can see the
workaround we ended up with for the PL011 in commits 5b87a07e768
and cc3d262aa93a4, where we pad out the C device struct and
assert on the Rust side that its version isn't any bigger.

For that particular problem we could say "you need to refactor
all users of device X to not embed it before creating the Rust
version". There is I think only one embedded use of the PL011
(I was actually expecting more). This does have the awkward
effect that anybody wanting to do a "rewrite device in rust"
is now forced into "do a big refactor of some old C code they
don't care about". We would also need to actually document and
provide some good examples of "this is how we think we should
be writing device models that have child objects now".

But embedded MemoryRegions are enormously common, and devices
that embed other devices that embed MemoryRegions are also
pretty common. So I don't know how much of a gradual approach
you could take for the issue descibed in this patch.

thanks
-- PMM

