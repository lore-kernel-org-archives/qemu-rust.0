Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB41CAC5B8
	for <qemu-rust@archiver.kernel.org>; Fri, 26 Sep 2025 15:13:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v2A8F-0002Wv-0I; Fri, 26 Sep 2025 11:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2A8C-0002Wm-2Y
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:13:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2A89-0004kI-Mw
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:13:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f42b54d1b9so2363630f8f.0
 for <qemu-rust@nongnu.org>; Fri, 26 Sep 2025 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758899582; x=1759504382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IeaGfL5y82PM4fRszhs44+scI4ZIezgDQTJXzXlry44=;
 b=ML0XYgqtZbeI7jdhvCukUI1dIIiG6oUt79O/X2cQth4q+ZZ/IeH9eKr6AJp6Si7f0F
 MlvBZU+WOQxhPk0ZQS3jA1lyfLJV22dY/THXrSSq1LHJPW1pPOKyb6j6uFkWTEgT9yxI
 WM5AIYmY0dbred7xJS1xXf9GIU0jt90GE63e95eppzolVpLSShlv/pX2LcN5dO7SQMZL
 FWftZl4PB18S0O3bsKo1+RrYp+R9CBI6ZWE7e8HhFllCac2ezzrz2TqisV/cKHN+EfLl
 9k2BNdHXFGsc+noiJWUD+oTVQu7Id82ay5gH9H/w34nNTQbYus8ffiVp2PlJWbJXimml
 uIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758899582; x=1759504382;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IeaGfL5y82PM4fRszhs44+scI4ZIezgDQTJXzXlry44=;
 b=GrRUA3LxMRXM2YOw3qbCNjk1uN4HVyvDs6MOGOC5/STDTb+NYrM/jMesaPVEa5Qioi
 y9BxPj3vFjNki3JOfDBxbZIx+d/KJq8nz0shoGNI4TgZZOQO9iO0OO5K1PVSYoJ29Xux
 Cj6uXQiOrPmqeFiE8y+6kx/ExU/bkDlGxZ7raouMSHeWLzmnhw9CPca6OTqdjk3zLPHc
 lDCRKW9jUnMu+C94A+EFHy2udKdMd6C7PXoWwgLozao+7YHU5bbEAfyAv2lIQQPKkaoN
 vZYEiST4jAehgpb5cQSOzA9Ya16gRjf2i6UP2n5jB6+wIwQfyhXrcowjZEpqy3CYZg90
 4L4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbNcWHK8U+JMR9TmFXaQm8BfcmhQGfq6eRhc7T6S7+ScOrq3jxz97iJH9JzqixbiRZahOnJqYG6E0=@nongnu.org
X-Gm-Message-State: AOJu0YxcChxGanBndiRnxDITL/uMvw8UZZFb9rdpn9Kn3B4dD2Y7Tx60
 KskpeyXmqGLE61GAso6tMYYPAq0Q5f3nLjMy2orPRQ3oOUTrPMtIwhqkeN7zR+Pir+Y=
X-Gm-Gg: ASbGnctIBraZpNDCptHTa74vVLjK82IKIe8xtC9CHHfVNleRYxZy/sE2voPxUw+X0FR
 f7ZgR60NmlU0vtpggQMlgA4Y0oQrn/KznQYAHFMvsH5UyloI3D6BwJyTv53ZBNGLDYr+LVKhwd2
 xnK3MmPKb0LD+mRUIkAk+Xdu2J3glqVWZkBH9u8v+upZ7ygdgUYRxejKbfhOaR+e9KsAtU7ZLzV
 1rIVu0NqkI9h1TN0IXiXkHLdlnYwNlx/pOPdd0js3TAzoYA6ML3mbxtfJoGLjLwFamL3yNcKkrP
 3XGj2LxcSc55rQn5Ei1IEu2jp0xtmyjTzk5Ndp+eLkEjgHv7JD87NfFJUcTJ3toxZPg0Ny2bXrX
 +51Lo8CTW84Ay9aSew0X3Ki0=
X-Google-Smtp-Source: AGHT+IGTuqyDJdFeclhrBsqIqaWDk+Za5TU92Fwsqye+h7alj4Jgk0YvmMKW3uiinhCpErDu/bAiLw==
X-Received: by 2002:a05:6000:310c:b0:3f6:b242:a519 with SMTP id
 ffacd0b85a97d-40e4886df21mr6639833f8f.41.1758899581928; 
 Fri, 26 Sep 2025 08:13:01 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fac4a5e41sm7937738f8f.0.2025.09.26.08.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:13:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 630575F7C3;
 Fri, 26 Sep 2025 16:13:00 +0100 (BST)
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
Subject: Re: [PATCH v2 01/27] build-sys: require -lrt when no shm_open() in
 std libs
In-Reply-To: <20250924120426.2158655-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 24 Sep 2025 16:03:58 +0400")
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-2-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 26 Sep 2025 16:13:00 +0100
Message-ID: <87o6qxi6wz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Fail during configure time if the shm functions are missing, as required
> by oslib-posix.c. Note, we could further check the presence of the
> function in librt.
>
> This is a minor cleanup/improvement.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

