Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A08C87FCF
	for <qemu-rust@archiver.kernel.org>; Thu,  7 Aug 2025 15:12:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1uk2Hn-0006QR-N9; Thu, 07 Aug 2025 11:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uk2He-0006B6-96
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 11:12:00 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uk2HX-0006Gx-JQ
 for qemu-rust@nongnu.org; Thu, 07 Aug 2025 11:11:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so540164f8f.3
 for <qemu-rust@nongnu.org>; Thu, 07 Aug 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754579498; x=1755184298; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nzZKHDdzB1VMGttSmHY8juU+cAh88BKNe6a+gQJg8A=;
 b=o3wXlYN8C4Zy/utn11tYg1TxcmJAA74L9OK05A/E/aGsioZJNiWORDyRqhhkMmzaxc
 XdxTeWr9H2AStog2uDxiDcmileG/skjE+3Efxa/b+/TLkOSGlXEXIvwNfMkgvXxwWeko
 AwEOQWEvePcpDVSJNS9pg7xcrcbKXVB3SscxSELEUqeNFtSkvWsYqB2Rs69Q/GcGBoVA
 4HQxSVnLANylXbCdLJqMUv3Sv40Jq0D/QYT9qxJ9r7qT7SOaWznubsUvxuGmx143Zqx3
 T4galqK50UHUkMCi1w0W0XObOQWPz+V1rn0030CRuK4/9q7d7NfHUVK0/3aKCi9RJ88b
 ByDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754579498; x=1755184298;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0nzZKHDdzB1VMGttSmHY8juU+cAh88BKNe6a+gQJg8A=;
 b=sVZ2cqo5QyA4F/YKLIDKkBICcDhTiq+fTI/zhTG++k1kZUYlflKuKhALwj1ffIfnh7
 Tq25Bf0WMJaH1Y0dldxdECYOqcCN1U7so2DLVmXqIp/Ek5Wcdsd5d0LX+feEccguzm3J
 BkNlXxp+2TGdY2T36cf2+WAGtEamxlbdewfTjBum18lDCvXr30Q4Os5bCVy9MKiwjdri
 QtmnircuvWoTlyyQH+qLhMwnyl/FnU97u0FSW4i/Tg8OtxYK8vxo+4fKZq7Uiv8dsCrC
 1rIabLAqHsXYxqxyr1FlWerOPuJX/FFvZHkntEVXcRhF4rPGaZ1RWuP0BbVe/gzNC4HP
 6TYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCx3/sg3749iV1tV5ctVhoU4s1DdRAq2Eflm+ybjMPsfUy8O1sAuIvZg88Jq+hzpZQVfaHqM0CtP8=@nongnu.org
X-Gm-Message-State: AOJu0Yzkp5A2E7G0i52EPpYZVa1zUEByieXtQ/0NHBtU03dr+lf8exGR
 d8YR2S/mCXCATtHonlo7sy0lBLUsKqT11WW6ec9g2xQ1ZKqPPJ6sdCJ+0wa1lDTbG4VVnliDbsN
 iaL7g
X-Gm-Gg: ASbGncu93W81jxHNBT6EwiM8Xlvvv27LgJ4NwZ5YkiNU9725Fc0rf5qxtkbQosaVse6
 qbmogvXFWMdBey4i0MbC9zUfA0WAZ3smWVUk9CPtwDO1ndftVuZ07JmBKe5KMl+IHPFsKhYfA5f
 DvzHFcmf2Mjgr47SUIUzBNczhSlRFpE9VOfxOgNNzXNR+j5TmUth5DlM6oT0gq99eFXoXN0jbar
 nbdVmVZroDCq9oqFk/RfpcVwRqdz0rLsJ+oLGhd/dPkLBxXtsX9oe6RGGYXq1ukwrEolDVXiIUL
 T1uKYRfb4KWJICC8RPqFw/iV7fYPt/l/8fJxGMSxzS2XOAmtHbxTQmyl5NHQmcm/vk2fZV8HT9U
 ukDmrbtI+v2cnOMmAYAWvp8o=
X-Google-Smtp-Source: AGHT+IHd5WX/CSj6LtAJw4/lXm8cPEz/pOhzsLSNtyzDUH4QomuzJMZloRiSBVYMaPyNaT6telnZHA==
X-Received: by 2002:a05:6000:2407:b0:3a3:63d3:369a with SMTP id
 ffacd0b85a97d-3b9000839bbmr10981f8f.25.1754579497913; 
 Thu, 07 Aug 2025 08:11:37 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9160sm27191581f8f.21.2025.08.07.08.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:11:37 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 56D1E5F88A;
 Thu, 07 Aug 2025 16:11:36 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-rust@nongnu.org,  pbonzini@redhat.com,
 zhao1.liu@intel.com
Subject: Re: [PATCH 2/2] MAINTAINERS: add Rust docs to qemu-rust entry
In-Reply-To: <20250807-rust-docs-add-128bit-mention-v1-2-1d8a1ece3a51@linaro.org>
 (Manos Pitsidianakis's message of "Thu, 07 Aug 2025 16:02:05 +0300")
References: <20250807-rust-docs-add-128bit-mention-v1-0-1d8a1ece3a51@linaro.org>
 <20250807-rust-docs-add-128bit-mention-v1-2-1d8a1ece3a51@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Thu, 07 Aug 2025 16:11:36 +0100
Message-ID: <875xezyxnb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> Cc qemu-rust list when touching developer Rust docs
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a07086ed76213e3a204bbbf3a83137f1487e4b65..82011bb097fccac3dcc9df46c=
db15afa41c44cbb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3519,6 +3519,7 @@ Rust-related patches CC here
>  L: qemu-rust@nongnu.org
>  F: tests/docker/test-rust
>  F: rust/
> +F: docs/devel/rust.rst
>=20=20
>  SLIRP
>  M: Samuel Thibault <samuel.thibault@ens-lyon.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

