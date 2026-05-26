Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0DACD5BB1
	for <qemu-rust@archiver.kernel.org>; Tue, 26 May 2026 21:03:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wRyvu-0004gt-2o; Tue, 26 May 2026 17:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wRyvs-0004gc-Kt
 for qemu-rust@nongnu.org; Tue, 26 May 2026 17:03:24 -0400
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wRyvq-0002Ff-FH
 for qemu-rust@nongnu.org; Tue, 26 May 2026 17:03:24 -0400
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-303dbfbec77so13114608eec.0
 for <qemu-rust@nongnu.org>; Tue, 26 May 2026 14:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779829401; cv=none;
 d=google.com; s=arc-20240605;
 b=kTdksK2qonVmXW50nXNtr2XGGYz/6JwF8pph+hG/W6wV5L17sO11xJ/NcGiArUqbVR
 qCoQ7PI6xylrnwY0w5B+qsqE/leyxyWryCBQWItyGi/2pjZu8VlRELoFsq4NMb0oQGV2
 Fw6s/UJ4HDjYcZpz7helRz5erEVcW8Ex03y2ES/4FJuipOFTZ1VQPOFhkNjUKnkcM0e/
 bzmZ72Zkg+lP6jxfbNblRpc8Vf/4235KxdL6N53dKkRtq+k2O6ENLaCKXK8K8yMrC48w
 I5w1q1Fwf1SHR64QpF7HMVZNZmBoVORpjGrk4mFNc2pKnHfzUBcMwu0345aGVQS102nc
 5EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KlOoT/qE+jmsU630R365P8zuAldHusIC0FuzQCFBsOU=;
 fh=2KeWJK4R9HyvjI4jM2tLbQVV6ZDHN64ip4cCOvcnxus=;
 b=SlfrHs+pvLnC0Sj5ajoEPdA2/u6bqUzfdhgULhoVpb80sqHVa32Q6E7ftcYWXFVLyJ
 tI7p47WtytNHUkWlvfhFRIGL11kp/QuocKVpqaZ6rD1EkS6XH5DfAgAhSIDzwwtK1k4H
 gH8c+1SeTZnVlFwckap+GRmqQKU3QzHVuSq/i4iE+8rDjuMaCyWxsx3s0jyhGaius56c
 etTlQ/o0+6aSU6XeK0DbGoE2PoXlwyS7Q7zm3N15kKIscnRHuhBL8etWr7remZoj/tUy
 Q9IEtqdQ2ITEMr3V6+sPYpXJ3fkaFz9uYKZ87NG9GR5hUbsXy5Z/jlJ08fezFHj4RlmT
 RldA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1779829401; x=1780434201; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlOoT/qE+jmsU630R365P8zuAldHusIC0FuzQCFBsOU=;
 b=t5q11mXPh+MkRCPhuJHHHUxqYk7nbkGh7XS3bLT2P5sIcmmxfYLnwP+Wd4CcMZybLz
 zqrwwwndMISqcZRJyy3UOkEw2mxs7nxgpAYIkwUakzfjUYV4y6XmdkA6D+d31fgHDzMT
 yqZ08UnjJWVt5RHIq4u+gK/r44OtmMTmcOyPf+EiCp1LXsJIKef6hcLfcFdd6iuRMaUu
 kONa6cWiCuI468ucHtBwVYVwRwhoo0yIfSHiEGMnFQLXAOBUP/uIICYLfrPGTAt012jR
 zAL/fxCeSvq6xEHSbOqjw2VGkIxerpNaffQ6Ohd2+ejROp65MQMtYHRbltt5NMJWasjh
 qR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779829401; x=1780434201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KlOoT/qE+jmsU630R365P8zuAldHusIC0FuzQCFBsOU=;
 b=eSIUKLV2WuazNNvcT79ZuHcxs3s3MzJemPwK7+EccFHm73zrbfH+zapk+0K6gO3gQ/
 3frUWBo0KesuHy7dsERccY9GYa1BAAqxK/83jKn3wArBoTyRUatyrBy+KgHjCyiYvGuV
 VfDlIXtLWgqOEtLCaU/2a2Hsj8niLuxPmlwMUwHtMek45lRfpiAlWSjXSJNjHMH5mtGU
 eKOobqwWGIQMMClXhkMc73nU6YOrQmkzZ/WzH5IuGD5Q6aY7XawB/iov8R6BZEVIj7Ng
 L6T6flNinzjK9kXY3WOMQ7035qNPikPNizEnTjXSjRW8XHg6T8475MtNOIvK8koGszAd
 xZUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9RyrQkJlqY9upFe0VwTMGYX1RJeni3iN52I614x60b+Y5UPX5ApgbsK+YR0K4Aapit8OVHQZwlvbY=@nongnu.org
X-Gm-Message-State: AOJu0YwIlUWbvGx/o3tvquphm1ktIrYM/6243FU3GhHKbd2sA7PGEurE
 JcFQi6nJX9LUDjERgit3BA5DAsMby1ZggfrnlZc4HAcvhjHOa8UtPmVGddwdF2S5sBqekvL/rbW
 Sxvq+DdNi/qm24sQB9ZMlh+gzWYbDAmY=
X-Gm-Gg: Acq92OHTEdRZrzktSGeTUphlJ6i6NRY6zugaY09PsaeO430vLgPlsroQiiNFhceow+t
 3vbs223X9uOThowjUerOD1hFP+x/bVdcU7cjLkUcRDFLXTFmjCfSYHi2TjnbVn529i+n2E8ffZY
 2LNPzbzHmDv197LHdPQrmMbQ4t446wGoyp4oXV/Y6bR8we+wkmFeG7gxY1tWt8Itm/wCGOVL1Ax
 IUBe7o7sjLc1l5qRZBgI3hNk3TcAt03iyTaDbAUlDdyRUCg2JEEoxoVt9+tIUgMJrgSj0fYmree
 AqgyohSdF9O5vUj1zrSe/pTNuQ7aX9u0D2Bms9c=
X-Received: by 2002:a05:7300:7c08:b0:304:8870:2ac5 with SMTP id
 5a478bee46e88-304887030d0mr4843030eec.6.1779829400374; Tue, 26 May 2026
 14:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260526175618.227743-1-pbonzini@redhat.com>
 <20260526175618.227743-16-pbonzini@redhat.com>
In-Reply-To: <20260526175618.227743-16-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 27 May 2026 01:03:08 +0400
X-Gm-Features: AVHnY4LKJUeIjhVw2f3AIgx5tbCuDrFOxm-Ptmk-7EVEpT2r6AJki3SjoS0THRU
Message-ID: <CAJ+F1CLZj+5sC2TbrHoOXz91cqb-HGKpnEMmD5A40he7fG6Geg@mail.gmail.com>
Subject: Re: [PATCH v3 15/19] scripts/qapi: generate high-level Rust bindings
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Hi Paolo

On Tue, May 26, 2026 at 9:58=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
> +def gen_rs_members(members: List[QAPISchemaObjectTypeMember],
> +                   exclude: Optional[List[str]] =3D None) -> List[str]:
> +    exclude =3D exclude or []
> +    return [f"{m.ifcond.rsgen()} {rs_name(camel_to_lower(m.name))}"
> +            for m in members if m.name not in exclude]
> +
> +

Actually dead code now.

