Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76738D5B16F
	for <qemu-rust@archiver.kernel.org>; Mon, 15 Dec 2025 13:02:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vV8DW-0002Pi-CH; Mon, 15 Dec 2025 08:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vV8DC-0002LP-Hw
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 08:02:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vV8DA-0008MZ-GN
 for qemu-rust@nongnu.org; Mon, 15 Dec 2025 08:02:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so39115765e9.2
 for <qemu-rust@nongnu.org>; Mon, 15 Dec 2025 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765803718; x=1766408518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7SIixOVId63ggZC847lYkwu/ghQyJOIoFY+mLl1Nlc=;
 b=My6osA4mJm9eXcLeOkrH6JRHlX80q982OYmGXxc98IU5lz2mR9eSBVb7Ejq1tsOxgm
 ts9jGCB4P+vwsyxb3V5Mi2wh2iejOerTGHE7aCtGk8D5Mn/a1xKjfQSpgJtzzdcH5KNY
 rm0mskjIjBLSMZHiypDmfD42RLRSM8k+zjc76L5PfZm0O9ne96fOcDy2S+kU1xgUUx0s
 NZtSL2acAc8JQb4olTGpQyAj0xI6KAJ/foUN5zjt7kcnpaHIkZF7fCIf30Zn4R6ZXbN3
 I3FLSB/y2kUKVvignL0olsHpPznKudz0qmCiG+2fsNG0v5wDefaS3DuLgRv2Yg9tNadP
 NMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765803718; x=1766408518;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L7SIixOVId63ggZC847lYkwu/ghQyJOIoFY+mLl1Nlc=;
 b=XiNlNwl1EsYP5uCLw7tWPZwdIiNcnT4t2tOd3wcw+EOkbyn+6Anji+XXWsK5PBN8nO
 OmiHfqU/WR3WTg403TKxWqT2DceT0tDzkhjXtif+Omkx6rE5roN0Wf8wUWHiHwwoyHIp
 B2nkcqvsSz9yAAIQkvv1/M/jk2VVen4LuexpErlEPzyGpmguKtCf+RRb57MFfXp5mT2a
 UdVs+Z8kS5LuHPF6u/fhzgQROsQU0sNYoVdmQ0V92/ruLAmK+d7Wj5jdhiV71mbxBuqp
 jzndtLxy42HWQ2lCxjqbYBHwHubNRbipfT8vRW5Ce84eJv81xUsmaEtlioMtx0QeUorI
 EL1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGmBsLRuuCZ2A/4/wcZjwtNbPP9zVfZ8YC9riaX4afr/OPSpnV/956qOzShbTmQp6zGBiFGz5RNa4=@nongnu.org
X-Gm-Message-State: AOJu0YwdbmIseRz7RLZX0mBAA6T5+I8Y4P01axGZl5nV2CpUtgw3co8R
 fhe/cEwd4xD8YG+KZxFOzCGVxFqSRHSBm0QmZkbVjh/7v03AWKibB0sE811xousI688=
X-Gm-Gg: AY/fxX7JooNgD3zMHxKZpUILLgAGDfPqIdsgramJ6MOwoby7LaSVSYxFVnoFlD0NI0+
 3Lq1yTfyL43W8PYWguQiH7P4EzOPBQF6HkmoPgfEMQy2pDDGQ3EO+j35NwD21n3aX5FAXlOhimY
 LlVYIcCwu2LCk8RwYJIMBdmAphjHvYcz///nUnWxY5QCyVx74ugWzRAb1tZOcuOlRI0InSvsnlS
 YTrOYupvSq7YHCiTgjdt3MwcSaJ3ncJGq0Zoj9V67JXwXDFPRD501pWKOkUMh/FVAEfxTVxlj3K
 H4tSOkxxSqa52+ntE88T/W+hzAB1lrDw9i9nmXGe41THAcZfkDnysmK7VtWWlibVvxgx8xMKY1+
 qSSSO10EQoXrcRvEkKap1i0IzFkOO5EOHuJfQ8w5ECxvpfUHnxRA/E5iJOGEG+o4LR4FiKtkONt
 wWuC10vDAaxtU=
X-Google-Smtp-Source: AGHT+IFOTi219ZbYr0naXrQG6S3EOdFNEDsQtxvRPKyJgU5yIcnMeFdt9qIolcep9MFzBsaiCR1ZWg==
X-Received: by 2002:a05:600c:8b6d:b0:479:3a87:2093 with SMTP id
 5b1f17b1804b1-47a8f914528mr101240095e9.37.1765803717890; 
 Mon, 15 Dec 2025 05:01:57 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4f4150sm185956455e9.11.2025.12.15.05.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 05:01:57 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 44B575F856;
 Mon, 15 Dec 2025 13:01:55 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, marcandre.lureau@redhat.com
Subject: Re: [PATCH 09/11] lcitool: enable Rust for Windows cross targets
In-Reply-To: <20251215075000.335043-10-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 15 Dec 2025 08:49:58 +0100")
References: <20251215075000.335043-1-pbonzini@redhat.com>
 <20251215075000.335043-10-pbonzini@redhat.com>
User-Agent: mu4e 1.12.14-pre3; emacs 30.1
Date: Mon, 15 Dec 2025 13:01:55 +0000
Message-ID: <87zf7jnbjw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> The issue that is mentioned in the comment has been fixed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

