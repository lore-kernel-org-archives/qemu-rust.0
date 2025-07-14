Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07926C83F1A
	for <qemu-rust@archiver.kernel.org>; Mon, 14 Jul 2025 23:33:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ubSen-0005lE-Fs; Mon, 14 Jul 2025 19:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ubSdc-0004a5-Ht
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 19:31:18 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ubSdY-0001fj-CO
 for qemu-rust@nongnu.org; Mon, 14 Jul 2025 19:31:11 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-607cc1a2bd8so8167914a12.2
 for <qemu-rust@nongnu.org>; Mon, 14 Jul 2025 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752535866; x=1753140666; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+q6JDKW6ffOwKsdLKOn7mz7nOnnpKSBfqn0q4Cb+uI=;
 b=E/jzN32oajcypK+Kd0+X8yD2bS7C7iEDcxbpLpHeBLDG8IAjfS82AghuN6ZgP5VpBx
 gzS3rQVXRsDIzPgsa532r68GHnGGakpQ0JQOcoiInLhIvGO2VFkbKvQ0wKX4K6hfk9C5
 oOMOtYbkc3c8YJZLUN2j6Zcp3REMELKewrnZYXYw/aMLMqxP5JgbAm3PvUz/0xxrk0tI
 44iq9f/FahkOOlcqmjuS3QxseRJHYukCIlQotBk3UAxyHpNBD+gh+/t4AhRX80pCYcwt
 gr5KzBETwqsE6YubwKF45FdaVlvmoKvNQfhKKO3x60mneApecLuqBCIbsA+mbZlsfvCT
 PCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752535866; x=1753140666;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p+q6JDKW6ffOwKsdLKOn7mz7nOnnpKSBfqn0q4Cb+uI=;
 b=qR6CvKvfb4sUwMpdIx/jo+we4FZV2RVRfmvwhB5hDQRk2T+U3+KCJZIiXsJAyqqq3h
 JHwyT1Oa1FPnbe+7hFiR8X7pyBT5XnNQzukVvvnuc/G37EMVkSIItWnBZ1S3+eZRt23v
 cSVWoRE+AB1sRA3VcKWfWEX1FLxJyXESCTrsbdHxjLy2ATC1y5rBnrnaEf+qAcvixVDe
 dB6EWgRVYRME+RFQ12iP+8f6UorKYw07kAlWAxoYW5g67UCnvCCWIqvJBhsW8x2Z1ecL
 +6JUTi3a5Hkf5yiQhvh3uc6Zmg5pCSrBicQYFMb5PbR60IeMIQLHSzCsKg/VgccZxxOC
 MUdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1xQ+qmAZdVvjY5Sq4atj/CkpfudvXKtv6P4pZG67nU6q2ebtdufZbjC9SgM/NRo0bkaorZwmGms8=@nongnu.org
X-Gm-Message-State: AOJu0YyN8MaE6MSvrqApLQgShkB7lgK+DdO7D1xrUeGMAmhRRyhkqPJ3
 72hk7pGlKQ4RxLntrxkClHWrCsSJr7ZS89eXrsf66gg6DT/9Dgmwipm12FubWZ1Yz4rekUW+bsy
 e0RoreBndt4BR5q9rG7eBg8zN74k72zYnx1U83aKq0Q==
X-Gm-Gg: ASbGncsQxTERGymvS3F1Gp0C5dQX8kHyQha/vCc7upHKBpiNI2/eiG4O36oJex74NqA
 ymVnLN1lq39H2IiNUGSyAWy6q1m0lzkOxZ35nm9BE/y4/OO+EgEQv+pfG3aj3g5NqYAWM+zWCpH
 rGo2tBwzZoAUwXPInbYgaSHaAMCTV+ObJkY4snzAJqOqb+gkiCZ4IefZe13qbFjqmmVBjQZck8L
 gz+iks=
X-Google-Smtp-Source: AGHT+IHcmk0rQdoqrVFraBYv8z31RPYVHHKuvgAH8P8RlwzX5g2sEwJcIdcx/psu7vAbzMnV+G76mAdoKFj8NB7fMts=
X-Received: by 2002:a05:6402:909:b0:609:9115:60f8 with SMTP id
 4fb4d7f45d1cf-611e847f9e0mr12086347a12.21.1752535866191; Mon, 14 Jul 2025
 16:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752534227.git.mst@redhat.com>
 <04130b3dc5af620213a90d300933517b39f43bba.1752534227.git.mst@redhat.com>
In-Reply-To: <04130b3dc5af620213a90d300933517b39f43bba.1752534227.git.mst@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 15 Jul 2025 02:30:40 +0300
X-Gm-Features: Ac12FXwXkhQG4WaUD4BKsRX_QTxHaJLBMpYUF5zCdV8wz0-5eENAQ2dqUkSRLsU
Message-ID: <CAAjaMXb5khPeO5bXGZ_2EALVWRg3i+GPimJygrik83f12JvFjw@mail.gmail.com>
Subject: Re: [PULL 28/97] rust: bindings: allow any number of params
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

On Tue, Jul 15, 2025 at 2:07=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> We are going to be adding more parameters, and this makes
> rust unhappy:
>     Functions with lots of parameters are considered bad style and reduce
>     readability (=E2=80=9Cwhat does the 5th parameter mean?=E2=80=9D). Co=
nsider grouping
>     some parameters into a new type.
>
> Specifically:
>
> error: this function has too many arguments (8/7)
>     --> /builds/mstredhat/qemu/build/rust/qemu-api/rust-qemu-api-tests.p/=
structured/bindings.inc.rs:3840:5
>      |
> 3840 | /     pub fn new_bitfield_1(
> 3841 | |         secure: std::os::raw::c_uint,
> 3842 | |         space: std::os::raw::c_uint,
> 3843 | |         user: std::os::raw::c_uint,
> ...    |
> 3848 | |         address_type: std::os::raw::c_uint,
> 3849 | |     ) -> __BindgenBitfieldUnit<[u8; 4usize]> {
>      | |____________________________________________^
>      |
>      =3D help: for further information visit https://rust-lang.github.io/=
rust-clippy/master/index.html#too_many_arguments
>      =3D note: `-D clippy::too-many-arguments` implied by `-D warnings`
>      =3D help: to override `-D warnings` add `#[allow(clippy::too_many_ar=
guments)]`
>
> I didn't want to disable this globally, so I just shut it off for this
> file.
>
> Message-Id: <a4c65fb2b735740bda2874c86de31d29a5ae24d2.1752530758.git.mst@=
redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  rust/qemu-api/src/bindings.rs | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/rust/qemu-api/src/bindings.rs b/rust/qemu-api/src/bindings.r=
s
> index 057de4b646..b4692f9b4b 100644
> --- a/rust/qemu-api/src/bindings.rs
> +++ b/rust/qemu-api/src/bindings.rs
> @@ -18,11 +18,15 @@
>
>  //! `bindgen`-generated declarations.
>
> -#[cfg(MESON)]
> -include!("bindings.inc.rs");
> +#[allow(clippy::too_many_arguments)]
> +mod gen {
> +    #[cfg(MESON)]
> +    include!("bindings.inc.rs");
>
> -#[cfg(not(MESON))]
> -include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
> +    #[cfg(not(MESON))]
> +    include!(concat!(env!("OUT_DIR"), "/bindings.inc.rs"));
> +}
> +pub use gen::*;
>
>  // SAFETY: these are implemented in C; the bindings need to assert that =
the
>  // BQL is taken, either directly or via `BqlCell` and `BqlRefCell`.
> --
> MST
>

Hi Michael,

This patch does not seem to have been reviewed.

The clippy allows are in the top of the file, not above the
`include!`. This should be a one line change and the `mod gen` wrap is
unnecessary.
--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

