Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2BEEFD238
	for <qemu-rust@archiver.kernel.org>; Wed, 25 Feb 2026 09:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vvBYn-00073x-2O; Wed, 25 Feb 2026 04:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvBYl-00072n-UN
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 04:51:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1vvBYi-00084P-TT
 for qemu-rust@nongnu.org; Wed, 25 Feb 2026 04:51:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43992e14638so139329f8f.0
 for <qemu-rust@nongnu.org>; Wed, 25 Feb 2026 01:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772013115; cv=none;
 d=google.com; s=arc-20240605;
 b=A45B3ASC2fOT7r2d5QB/aDsZXLKq7Ng8SDDsgLtInNxksXm4iMlEkCOsh447MsFihK
 QXffVCieDB38fXqDEujj6RDugJUAvt+X+A86LhmmQFSdm5nzaFAvPQyWWcwdHWeB8U0Q
 RZ2z6pf4oi3SNQ6MmK1MOx4FOeHfxiJ1VrHtMQeqZ+5cnzke+IR58653fnvkDrddEeeM
 FEeCFQnf2aKTier9xGTgsyQeoSQ7YmhR2zHANzoUdoHYdyq9RDdLmCk9y8dzUqtSK4vs
 BNl6AAhzMu/7Lr9EXmwLU4YnwokeKMwGOST57pPOcw2MNQVRRFjREvtLe/u7XODqtGEx
 SkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PdY9+MHTZgnTuYGAElSPw90dj0N6AYyklW6aPYrWaEo=;
 fh=HR5InS44P8SN+H4Df8mxi56fRcvbIPmQSyyIs7zChSs=;
 b=HOhhz8KItcNia7Q9qX8n6TW5Le2HgPuKoVkBxCpH6k9vxomo3m+bUsCCGitdBqH7vW
 4Spb4h51HMOb/0yG8k6eIyX5gOzTLMtf45mfAdmh+6YqA068b5s+s/LLb5fD/34YFTZM
 UB1fI3M0BKPWFKYd5Nt4gOio8ezePgFCYfT6Q9fUGiMLPHMiXI2i/mUqdOFeiEA7b7Vz
 lxfi0L4oehO2NFnR7huEt3fNIQ2FlGn9BTskHw4d+NLrGwM1PpurR8VxmQgtsIBu4Khr
 5SPv/HB/D2V73g4YBM6gEHk+x7p0Z9tYecFh7sPnNdRcTdcpG4GmFEeeDMvugK7EtjZX
 5n4A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772013115; x=1772617915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdY9+MHTZgnTuYGAElSPw90dj0N6AYyklW6aPYrWaEo=;
 b=qgMBNXM8BsgQqCgUQsgX/nSlQHgORXVmLUHmWPUhNJZMVwq7Zp4V0wxZnUKxdfSelT
 BmYw19LJ9hDbe+2dyLAz/r0XnDzlsRPq92cTKLSeBtH6d2M7JZW3YgA1JDQUIhfZ8ITt
 M8KLtkNs144nfKjC18xgKHDQQ1cYDxpqjcP1rnOSFBJRPGfggoeVAVcnZzwJzTm/evJd
 9FgOygyaCGnMX+Y0IicwRsubRoirvPrE7rMQjHnmz4fMSi+W6nNZCMyEHgAxiBgZxr1P
 C9VObwgUFtWKKG/IzDAKpJ+nkbJeCXT9ao6R0iQJkHt1/GbKCcXqw2ONJ48flSi5lpfO
 RixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772013115; x=1772617915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PdY9+MHTZgnTuYGAElSPw90dj0N6AYyklW6aPYrWaEo=;
 b=BKTt5TRd4DBYWfShpt7r0qvs/Lfm0dMrdltK3gXfNdz2288mMkv0FhCTA78N3PW0mB
 pE/8Lp5PzmTTrS5Yr2HBrhwgxCc0KHKtDQeM8DJaicMoY1y3u7RjOzCfZhjwa1dJf3Id
 max7WjlfwNURo/1p25eBf4hmhE0x+prjLN87z4+/ZWthMtqJyEZJGoS/cRaAnPKE/SKv
 d1NSsmbNahaW8sEuD+TWMcob777LC1r2WZBtU4c6lZgF4pxTF15M5S0uAXgFruMhhdr7
 LpXFcXfpHlZMs+v77VSAEIkqHBR3Xszm3m3zvCWMMhfzdH07aLvhxKo6BkwyiUfzv3uW
 AiGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUwEz64hpX2tDM/BM673ttGlCnrfqQ8X08b3H+cHm3dben0MHqD19neR1SyIwNCs+7EFGlBmPlgbw=@nongnu.org
X-Gm-Message-State: AOJu0YzBehzufMvZJMxyaZJKvsyI41w1wzc/FcGf2ySRN7jk4USGGDqr
 Yvt4gPXN8psGt8lM0UXVu2NBRbBoHP2AVxgkCAFaeIPBCUm7jiLcg7jTozJJ86wayt+1amAX920
 ++ICpS0/UpW1bIu9KdlPpn8qGHR+WKsG0EhaNupLQ0Wc2BQWmJ0pq2M8=
X-Gm-Gg: ATEYQzyIStJUwBh8UOHjQ61RTatkhxhE5avtT6dYfFH3quM/07LSb5AB9HsoI4bevMU
 6iaQekkIhf0kZ2xvlAK3aeNw5LJgjHN1kK9HJGNhxXVhTW252sSkrj1OpMOjD/HQ1aWl0iY8hxU
 sSOwthPJd9Fag6N5e2EV4m3eyVLJznVh5a8FFMfHj4wEx/OyaaNFadoWpviwFTBcX2cd9MRFqtS
 21wNA2ZO3LdJAJLOqp1HDKDH0PkvYkZLLuGg5e3MEtto1I89NRwFxSnIT+NvMb2JNrs+uUiDcJQ
 /r05dgM+kiEqE+Z5q9H9wjXR1HUgnq19ml0GgMe9uLj/3zo4gg==
X-Received: by 2002:a05:6000:430b:b0:432:84f9:8bea with SMTP id
 ffacd0b85a97d-4396f1884fbmr28635715f8f.51.1772013114846; Wed, 25 Feb 2026
 01:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20260219185409.708130-1-jsnow@redhat.com>
 <20260219185409.708130-2-jsnow@redhat.com>
 <aZ7FtAUfAJ0-y0qT@wheatley.k8r.cz>
In-Reply-To: <aZ7FtAUfAJ0-y0qT@wheatley.k8r.cz>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 25 Feb 2026 11:51:28 +0200
X-Gm-Features: AaiRm52zkX5a5UOo-Oo1K3P4HqIFnRhzk70lMJ4eWUO9hzxNca4uxY_3itE4Gvo
Message-ID: <CAAjaMXaBWSp22NZM6QOLCQGvh+O1SMjXUPFXYHnMEmOH3EFoCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: use checked_div to make clippy happy
To: Martin Kletzander <mkletzan@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-rust@nongnu.org
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

On Wed, Feb 25, 2026 at 11:49=E2=80=AFAM Martin Kletzander <mkletzan@redhat=
.com> wrote:
>
> On Thu, Feb 19, 2026 at 01:54:09PM -0500, John Snow wrote:
> >When upgrading from Fedora 41 to Fedora 43 for CI tests, clippy begins
> >complaining about not using checked_div instead of manually checking
> >divisors. Make clippy happy and use checked_div() instead.
> >
> >Signed-off-by: John Snow <jsnow@redhat.com>
> >---
> > rust/hw/core/src/qdev.rs | 14 ++++++--------
> > 1 file changed, 6 insertions(+), 8 deletions(-)
> >
> >diff --git a/rust/hw/core/src/qdev.rs b/rust/hw/core/src/qdev.rs
> >index 145e20a984f..b2e5441079d 100644
> >--- a/rust/hw/core/src/qdev.rs
> >+++ b/rust/hw/core/src/qdev.rs
> >@@ -425,18 +425,16 @@ pub const fn period_from_ns(ns: u64) -> u64 {
> >     }
> >
> >     pub const fn period_from_hz(hz: u64) -> u64 {
> >-        if hz =3D=3D 0 {
> >-            0
> >-        } else {
> >-            Self::PERIOD_1SEC / hz
> >+        match Self::PERIOD_1SEC.checked_div(hz) {
> >+            Some(value) =3D> value,
> >+            None =3D> 0,
> >         }
> >     }
> >
> >     pub const fn period_to_hz(period: u64) -> u64 {
> >-        if period =3D=3D 0 {
> >-            0
> >-        } else {
> >-            Self::PERIOD_1SEC / period
> >+        match Self::PERIOD_1SEC.checked_div(period) {
> >+            Some(value) =3D> value,
> >+            None =3D> 0,
>
> This looks like unwrap_or_default:
>

unwrap_or_default is not stable in const contexts so won't compile.

>
> in case you want to make it shorter O:-)
>
> >         }
> >     }
> >
> >--
> >2.53.0
> >
> >

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

