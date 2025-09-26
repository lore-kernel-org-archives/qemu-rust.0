Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB9FCAC5B8
	for <qemu-rust@archiver.kernel.org>; Fri, 26 Sep 2025 15:45:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v2Ack-0008Ud-Vi; Fri, 26 Sep 2025 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2Acj-0008O9-Qw
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:44:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2Acb-0001NJ-Kc
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:44:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso14663315e9.2
 for <qemu-rust@nongnu.org>; Fri, 26 Sep 2025 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758901465; x=1759506265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehHu+AJJTLVFFlN8btUv+fyxSIRKavcO80KOfGhNBM8=;
 b=ZJS+XzyTfw8vkt+0iBBD3Tuy2p8mcDHdsUI+SXAe3SV3xXmtvTIk4zN+l11gXqkh+u
 4+gnKtw3Zox5GIumYYui1LFTWuuQRox1OR36SCCxyCvn/YIkBUsLbIxuwhAcyCyuqbBi
 fo7k2KqmB5qgn12vH86vlKSFJfFW2PKOZmZHdzYWXOCYjc52jCDR4cj0BK1pL8JiQy3B
 7ebc5knYzwbBFiMOIjTrodDg/RVOz1f9tf1az8tYfXFw519jQBPRkQCIb6to+yJPpJfH
 p6QxCVYMbBCD6cVhrT6LrySUXqoBEnReKxQUlwPjRLUtr9YImjwUfNCMny5LoHv9HTCB
 2aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758901465; x=1759506265;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ehHu+AJJTLVFFlN8btUv+fyxSIRKavcO80KOfGhNBM8=;
 b=a1OCoKdJn/r6Jefnvl1yatOT8C/n1UE4BZ0KtD1oUx53o/QnvhCuVrzc2k12hHklLk
 gCqxVYGjlaozQW//49VxiSgH63aPyJNR/JqZThNYB0yTPR/FGzhBYRQTiMv2Tol0X0sY
 mOoUA8tCqN/Ride65+Hn7JhEhZd2y/3y+eZaKE7o6qXF2nW6M56eotuF/IOYeWSY2SKG
 62kBef7bGye7yQvbS2iK4OmQfrwWoZUz0K8Y7pbNvMvDLFxnBEMM2EUZGYoNEf6HrebV
 M0sjaIReLnJg4mlZ9HVwQmfzPOZ8DzUyuKVCue2nviO5O3ndPfs3NrlQQLRJLO1bjSp4
 uGFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT5+f6BL4L7QnXAJMKqU6ZIUmJjAiOS2Kzp6Q1BMBCEsuBepcngiHjuPZ7jY/ZSLftifm1eRzBv6o=@nongnu.org
X-Gm-Message-State: AOJu0Yz3vJrklUR85A2+B1yk0WIC4xEjBz/PEGnX9fcoTwzyRkAMH2fE
 alXjmo1WljtqOyATPTKV7k5DuQewi+434nZuxabx6BMLb/HLGLKpj+u8nYa+wdPiFqA=
X-Gm-Gg: ASbGncuORfpZR/Ir4g/MRdvCOfcWGEr1Q+TENTwkMsVcasnt8IuqQLLfInzaW8NzaWQ
 eAVSm2FaFlcoKdkF55zeJcY6Dtb1m1pWYrO1RoIjtzaXnpUrBIFYJIpxMtyLHTXAUP0kXnDpVHu
 VgJMD8AZafovNgHRtVZeYfRdtbw/oUAqevr9QVX2NyDhruN2A8LECETWxNPY6r4bQZMxaakxUrT
 3HrJR3Iqv8DDwHu9cg+74EFmtHRRhQzKh1FAAhS5jI202xPrYTZIkizsDTHA24Z4s2i1BY1Ro5h
 5s+DdUjw7f0cbrkSdbJlRHwWTq/149J4KsPRm6mkeDFqRXyp2WaicpnazdrY1IF+JoFaOdjIsKW
 jlQV0x2c6paIXy3azK1Vw9Ws=
X-Google-Smtp-Source: AGHT+IFGA/N+MueinqqXZw6SEs+nJRHS5EmfJAq5SV4IVic6KTR9UJEfB+3l0GImVmNYcyoEfy2YcQ==
X-Received: by 2002:a05:600c:a086:b0:45f:28dc:60ea with SMTP id
 5b1f17b1804b1-46e329b63a8mr88103535e9.15.1758901465316; 
 Fri, 26 Sep 2025 08:44:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e3bffe67asm34859785e9.5.2025.09.26.08.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:44:24 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B1DBA5F7C3;
 Fri, 26 Sep 2025 16:44:21 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Kyle Evans
 <kevans@freebsd.org>,  Yonggang Luo <luoyonggang@gmail.com>,  Li-Wen Hsu
 <lwhsu@freebsd.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Warner Losh <imp@bsdimp.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ed Maste <emaste@freebsd.org>,  devel@lists.libvirt.org,
 qemu-rust@nongnu.org,  Kohei Tokunaga <ktokunaga.mail@gmail.com>
Subject: Re: [PATCH v2 05/27] scripts/archive-source: use a bash array
In-Reply-To: <20250924120426.2158655-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 24 Sep 2025 16:04:02 +0400")
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-6-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 26 Sep 2025 16:44:21 +0100
Message-ID: <877bxli5gq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

