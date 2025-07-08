Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E607C8303C
	for <qemu-rust@archiver.kernel.org>; Tue,  8 Jul 2025 21:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uZGGX-0001i3-LC; Tue, 08 Jul 2025 17:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZFMk-0000xe-Jd
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 16:56:41 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uZFMg-0004TE-33
 for qemu-rust@nongnu.org; Tue, 08 Jul 2025 16:56:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-607434e1821so6846624a12.0
 for <qemu-rust@nongnu.org>; Tue, 08 Jul 2025 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752008192; x=1752612992; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQnPm7OMUxUj9kgIE7V/5Xg89kaFsjsthn3fZVSeLuM=;
 b=TrvupDzfm5vF2oRUE1HK/rtkYEV+KTYfxVgsS1GULRgTarwGOlURVcpiDxRT/7R6do
 53GMMk37s0di9NteDwWhUDAtEvjTliNjX2cuB2IKsqWjoN978Is7eWCZjszrNXfNIcSS
 wpwVIGJ4JURG0P/tqIKe12WZiabwzzVDA61pGtzoCfl6WrghwUjSvleDz21u4q1EK7qu
 MlVCneQx6ByVCqDnsnQp/pQ9PbpiQg2wr9lPNvtihr7KmlhTJN3tn6qBlhfBuVh+TmRw
 Mruatt966vrypZn4PTdktfN3TiR/MeOHlmQ+G4IWF9dLtFgn9vOkog3NftN+zyS/F3VY
 7DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752008192; x=1752612992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQnPm7OMUxUj9kgIE7V/5Xg89kaFsjsthn3fZVSeLuM=;
 b=V2dfdmaZPFNF5UT/ko+HbwFgLDUWe89PTVq7M+v13o09ZYKd02qmHE3Okz6s8ETpGe
 vxNY6r8jBP4Mh3qt0G2lXiH/iRKUf7ZSuUD0D7+SnI9f83m39O0unK71QTADwDQOGkVR
 qPb/bkav28n2ybEm51XXgDKN9IGT5JhPE4H96ylNmr/c5DS+ZwznMBPX9a8Tsh+wvesU
 4S9YEZTPZq5K2+rciLlLQMaPnSJOUkKs+OYvVJNy/2IGyZj161GpM5ql++p4MNma0tbn
 Ow1FZG0PiPmqIxLK//UVdTc5MITcnB9LtdQN7ItzpbSoU+g5CKZIbJguJaC0z+EPeV7B
 SF5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOrrJLDXBPqpbMu6n9JoKbj56H3jB2pbXqqMbhtYOg+5cJbdd+iF6+kaXvdmGNJ5FiUF9Au6ZZFSo=@nongnu.org
X-Gm-Message-State: AOJu0Yyyc9cXhwH2iY+7NJZfvCIUHz4qgmlKHXwxTtwIDcgaAQlMn85H
 Vx0cT7jlTHIdE7NQsoZCMivW2HsdM4Vz50JJ9cd9X8rdN3fp3OsNGZFqgmrt9NtOUbDLjLcNhGY
 Up6iXeoqxNYJo3kH+AbjNkaF1/Y+HiKFJNo7fI28ylSZRYDAdcYDjqKB4Pg==
X-Gm-Gg: ASbGnct5rAexMDx9Im7QDuHrgF2e2xy/V0BTSYhJ5nwSb7AN38qBSm+6HEHIPLOeifL
 4y9jbFBPqQl/nQVzDrVjlsLSMAA1oYxhuvAxF82Mfy33P0a5Vra6pDswsCIa+YXeLl/sVBjP+yY
 fpz1TV5J+oF5r8hdhbwqKBKDes4ryjZ43I4AnfgSHNzU0=
X-Google-Smtp-Source: AGHT+IFfpggFdOxj172OW8RoiRnOg8d7/ZBIpPvPeI6W60v/YNcVFVsXg4hutuy34RcOlZ+7dHMKG46fAMK1ZcNruGY=
X-Received: by 2002:a05:6402:51ce:b0:608:66ce:14d1 with SMTP id
 4fb4d7f45d1cf-60fd2f85538mr13613177a12.6.1751965911713; Tue, 08 Jul 2025
 02:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-rust-mem-api-v1-0-cd5314bdf580@linaro.org>
 <20250703-rust-mem-api-v1-1-cd5314bdf580@linaro.org>
 <591f8a81-2c8e-4e30-abf2-4571afed41b4@redhat.com>
In-Reply-To: <591f8a81-2c8e-4e30-abf2-4571afed41b4@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 8 Jul 2025 12:11:25 +0300
X-Gm-Features: Ac12FXxuB6uXlv8JaSfaIgQfWwvDlv35gmb2UGJcAEboo3yqOfQmRkMT69epVEo
Message-ID: <CAAjaMXZ3JziZ6gUHF67=nqvxzUF0M46SPqftRKgHOYYLaUxjJg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust/memory: replace size arg with Bits enum
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Jul 8, 2025 at 11:35=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> > We have the ability to make memory accesses use a typesafe access width
> > type in Rust, which the C API currently lacks as it does not use a
> > newtype wrapper for specifying the amount of bytes a memory access has;
> > it uses a plain 32-bit integer value instead.
>
> I find this both verbose and (ok, that's subjective) ugly due to the
> extra import, the underscore.

Yep, I agree on that, but I wasn't sure what name would be better.
Whatever type-level improvement this patch brings, it's small, though
nice-to-have. We can drop it, no problem.

>
> There are two parts on the patches:
>
> 1) the extra checking on impl_sizes and valid_sizes.  That's valuable,
> what about just adding something like this:
>
>          assert!(min =3D=3D 1 || min =3D=3D 2 || min =3D=3D 4 || min =3D=
=3D 8);
>          assert!(max =3D=3D 1 || max =3D=3D 2 || max =3D=3D 4 || max =3D=
=3D 8);
>          assert!(max >=3D min);
>
> It can be validated at compile time anyway, since the functions are
> pretty much always used in const context (in fact, for C code there's a
> scripts/checkpatch.pl check that they are declared as const).

Yes sounds good!

>
>
> 2) Passing Bits to the read and write callbacks.  The argument is
> ignored for pl011, and converted with "as u32" for HPET.  I find this to
> be worse than before, because it's very unobvious that _32 is defined to
> 4 rather than 32.

Maybe do a `Size` enum instead that has variants: 1 instead of 8, 2
instead of 16, 4 instead of 32, etc.?

>
> The main effect on generated code is to add an assert! to
> memory_region_ops_read_cb() and memory_region_ops_write_cb() that's
> similar to the above.  I'm not sure of its value, either: if the size is
> not 1/2/4/8, memory.c/physmem.c must have screwed up big.  It's not a
> safety concern, either, since the size is not used in any unsafe code.

Yep it's more of a guard rail since we can't have refined integer types.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

