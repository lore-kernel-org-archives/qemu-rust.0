Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D2E9A02C
	for <qemu-rust@archiver.kernel.org>; Wed, 18 Feb 2026 22:19:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vspsZ-0005Mh-Md; Wed, 18 Feb 2026 17:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vspsY-0005MN-UJ
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 17:18:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vspsX-0007Nr-Hs
 for qemu-rust@nongnu.org; Wed, 18 Feb 2026 17:18:42 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so224144f8f.1
 for <qemu-rust@nongnu.org>; Wed, 18 Feb 2026 14:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771453119; cv=none;
 d=google.com; s=arc-20240605;
 b=eKSl+mhCcOqBRZMBQRhFBgdBerGcbNmNq32MhZvxe0FU15W5qQipm+k920nSXidNuV
 FOE7kqeZ9SqWNAPAKi9PP2ccEDr4rJcDP3m1U6W93Yop7GjJd+PkzM5MOQ1EhmeFOVx1
 2G4D2wNrUCRYzIdI0OkPq5jIC50p9O6p0ueJkGkIcgQGoQvuTupaNYSR+L4lOhBeo5DI
 bgy+ILuK0WQzhkXXxvnoZfwi9ZuRufP2H21csJcygiuAEXI1YlBCAqvbXNudQLuOW5NJ
 FFdWhJamfaEYUgxazE1gnYCa4sMcKICZ53eSgyJpTgt+rrJz39QrONAFlaOec2zhYHca
 PT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kNLdJY+bDyZs3AuromPUlwhRlMeM8vZOB4FmPTCEEDk=;
 fh=1hZoOtYs5GneibsR8+usbKOFcVNg9vG9xv1eEexBd5s=;
 b=Zyjq82qbY98xXzelFSKawZXNwOHajeevvPiKbrbspYxJ6Yv92HdTzo+EVqxh4lOBcM
 Py2647+fXmRezxMC+svg6dodgmPkMBk9u20k8zRgynMspDQQwNi87DOhZjYR2k9ZUIhT
 zDwtgozMMmOIk9SEpW89+uow+8m/ZbpaiEOSmOnuAmIFSGy2XfNyXv4mcoz9aiKrEeW/
 mK3F1Vo/avLR7nzErgrL5rv/25VqXC4xhO3ZFPgS79SKwP9mNQ9HZex9Jp20ilmcyfpf
 eb9zEGhk5E3dreCkXJiaOIA5QllfRLXDSjTB3a+rAkOeZtve8fIQuz60PP7GTckHdiMl
 Q2DA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771453119; x=1772057919; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNLdJY+bDyZs3AuromPUlwhRlMeM8vZOB4FmPTCEEDk=;
 b=w1MSnC+HxhpD8OWnNb0dieSplIg73A65YH/L04PL2EinexvL79DubhMbLWNZsfh9fU
 ifI9kT8+BIhpyvEL9eOzMG/rarT/IR0ZLYqQyU5ZyqbgGEpV4a9RAmXUey2UhW/iRWos
 3qWUx+urI2pBy//dW2ijfKNM53eCIo6yGxX6j4teaKaMTMLIoRDK35+jQq4eRwTqXBp8
 SMs3ReD8hycDM+JBAByThJWKOWYwXoIYu0X94ddW2w+b3pn0urR+WCpOOYTQaJ+aJNDp
 5XfBxSuJkwfiCCOBN6QFAOF+VdYG7c+ONHdZNidFUK2NzifkhpgRj7KDV2i1o2IFsTGc
 fsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771453119; x=1772057919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kNLdJY+bDyZs3AuromPUlwhRlMeM8vZOB4FmPTCEEDk=;
 b=M6+LAor5gf54EHwgA98JRt7UGkyCiR6TfR2+v73rkQ0ZcmIo1fa2iAyIxfQkTbNxCn
 fq/jRFL/lHE7RDb1jgAE8hJSSQnxKBcqT6ypjBSIejIWUK/VoMgZFS63k5sxyDLqrxzx
 PCBzgzPRtNpsVj9U2UlBPqgwCfwa7rP55GtIylGs27qwF8EBR2c6pWvkv7wRJ0E6ePZV
 5Ff257lrZ9IEzLnWVVsh1Wyc5puKVQHzVNyUG7whPWU+4yLMppXBmmkoc2xc8xnHMDSU
 4ODmY19O4jw6fEzRfWrCY6iDbb14rLyYrbPiAd84WNgcMaMR2+vGwo/Msxi46i+zJBC1
 oU6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7UunP4AHdq/kVmbU5LlBPFZkd/M1r9G/KN35C04jAO6NbTs8suVGuPh7dj25wDCTRSsAJ+HLc6OU=@nongnu.org
X-Gm-Message-State: AOJu0YwT7A4Px5+ri/H6cZxqDGWexQkQZAxwfKaaTb6LxRsOt6GjwyX+
 q+6rAbX2GJQFcN0IDXs7XuLLg1kO8OVapgqzsffXWdNv2bEOFeDr+TU/4fCthYHbPwAmTQTGnSv
 xNvzE4OfHq2q7AiqakaCEMysK2gkcKA6IBW5+UpqVvg==
X-Gm-Gg: AZuq6aILrCtRGjR4buv5f2lZ2zham1Wt8tR3zg/Iau0qRxtNwSIboeWa/c9u2as9qYT
 Tx4qB3RExY3qvljgHPWjW01q+w/mG4W3c3OMB/WLCLzSMnexoxHA+fbE+jXnDd/AXrBCWVy7qdX
 r3MUeUBjYrtpl/yFcXQO6zGSWQaXcKxOMBV6XaSBru7Gf57YVCfPnRWwY9EAAVfCFDetllANNnR
 GLQCrSUiH7rKariZarrOrivsu8idz9RCBwv771eKxETNF9jK6l7RT65T0D/7kfcf1NkaAPe5M6d
 YWkBy5uDSRC2UT1t56Iym9C53+OFY5MJ7Spz5DAI5yRXzzwo2A==
X-Received: by 2002:a05:6000:4312:b0:436:233c:c7c2 with SMTP id
 ffacd0b85a97d-4379db33f54mr26262939f8f.16.1771453119201; Wed, 18 Feb 2026
 14:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20260218192444.658046-1-jsnow@redhat.com>
 <20260218192444.658046-2-jsnow@redhat.com>
In-Reply-To: <20260218192444.658046-2-jsnow@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 19 Feb 2026 00:18:13 +0200
X-Gm-Features: AaiRm535NhTbxtVoNzWAkZd10x104joM_zkHi6QJ3UwISn6egz6codQUPm4zWQg
Message-ID: <CAAjaMXYmdTmKRXMs83DH6Fw=BDg6_KiHgOTghFG5MLmEt9nGqg@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: use checked_div to make clippy happy
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
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

On Wed, Feb 18, 2026 at 9:25=E2=80=AFPM John Snow <jsnow@redhat.com> wrote:
>
> When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins
> complaining about not using checked_div instead of manually checking
> divisors. Make clippy happy and use checked_div() instead.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  rust/hw/core/src/qdev.rs | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> index 145e20a984f..c4a7312168f 100644
> --- a/rust/hw/core/src/qdev.rs
> +++ b/rust/hw/core/src/qdev.rs
> @@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -> u64 {
>      }
>
>      pub const fn period_from_hz(hz: u64) -> u64 {
> -        if hz =3D=3D 0 {
> -            0
> -        } else {
> -            Self::PERIOD_1SEC / hz
> +        match Self::PERIOD_1SEC.checked_div(hz) {
> +            Some(value) =3D> value,
> +            None =3D> 0,
>          }
>      }
>
>      pub const fn period_to_hz(period: u64) -> u64 {
> -        if period =3D=3D 0 {
> -            0
> -        } else {
> -            Self::PERIOD_1SEC / period
> +        match period.checked_div(Self::PERIOD_1SEC) {
> +            Some(value) =3D> value,
> +            None =3D> 0,
>          }
>      }
>
> --
> 2.53.0
>

