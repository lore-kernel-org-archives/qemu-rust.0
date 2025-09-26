Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F737CAC5AE
	for <qemu-rust@archiver.kernel.org>; Fri, 26 Sep 2025 15:23:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1v2AHx-0000C2-0p; Fri, 26 Sep 2025 11:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2AHu-00007q-FQ
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:23:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v2AHm-0006VE-0A
 for qemu-rust@nongnu.org; Fri, 26 Sep 2025 11:23:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso20848775e9.1
 for <qemu-rust@nongnu.org>; Fri, 26 Sep 2025 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758900177; x=1759504977; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCaIDOvmlMCmdkKsmc7xs1lEySgRK9lBDSltiGmWm3A=;
 b=omEH7PXSQalKtrI8k1u5TV49qkA9Brrte3EZo13epq1tKd8Abu3TLpEMtfccEH2V33
 SFe2EwIJrlI4Dgld+hIjqXE+Oi49p85oYE0ALD+fefW6mly/9ARdupgZbBL0uyk17k6t
 VrI0SKh34vXfPXt82a+s6DCv40D4UV/jjgD99xsk/yvJSxA5TQxUzPqRWKOuYifr+AH+
 mQdM0dukvN8mPo5QDtBZ+ShzH3mH43k1CQfwwmCpRQHG/wsoHuOtUEH5wpjk4FIIGurY
 lQ2IEQ7LsB7uPifwHw2FOtbKOD487XWDSeRaZp7SWguPdNj0hQGBfOzfc7T/d63n2jKP
 eu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758900177; x=1759504977;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bCaIDOvmlMCmdkKsmc7xs1lEySgRK9lBDSltiGmWm3A=;
 b=Dpk/weB9VmKQGA7HOSoiHDhEqdscwLdUVfeT4cmtrc9X06lLUakl3HMv4ELpfHDiN2
 YfDw+7Lx4zmtZtzdvhAyUiaFdZCLwkdG05ECZ3hseZnyot2WGzq53GzCXP+6EvskAXu/
 LA43vkYoWuwwoAFl2hW2r3rJNOLlA3mn62wo9qufSABGQEJbA4Nw6dpgBRQUKzVYoE9q
 F6ccgjFnDkJpOsCzgfNckGnA18nV+x8tsefJLo/C3FzZ1fUOpNPJRYdF/fEbjhmcDmQk
 F9Db5Jn0/izAQrRR/wJpvBi7i4WqdRAY+qb6mzcCiHAdczOxdM+eVRDHePTs11bpom4e
 A+Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQsZU38YgdqVRuVl2jXKSuKz/JXhTdREDUGf0ccZ5fCz2C2oO+57criW2qWXILac3D+jBocYuhCNk=@nongnu.org
X-Gm-Message-State: AOJu0Yyx0qMKUTxMFLMSfKvkZbcA9dDUSVV4vQcKiLIUrcbVJRtHUnXz
 3aULAWKkObEIyfUO0+XeNxwGNJh38YsPj0Dq9KzH9tGb3x8kSTqz9HMpc9sRlbCoDcM=
X-Gm-Gg: ASbGnctStLARRNfei6dbIpvQrZhFPRnWHDyPBDAf8MSjPM/qU3FLlSMHFYjrUMxeLD2
 lflJ62lKgdAzEE8s4io5K2HLQgTcXMQX18BJy8FrLxAHL3NyOldgTmYQtJRFFT51Iu4tLH1Fj6m
 x5lBV636H0/YGjUlDvVDlyfAHIPqXNGyma3LsvseIpbF5sNg0SoD5cxVJ2IHUeX3x7lUAVi7Tim
 xEFR6lb38ZNAFqt8eSvpx1FhTBxTKHTPTX+lx2ZsuPua6B9P/Q1AajviQY81whNQuXcfEZj6bKx
 uFIvNbtyS7HL/RVBw63KS6euTtlftTaGWAaMhEFKEdt/oPhEHxncKilpmk1Drd3IRpid15j0rlg
 DUQCOZgwREjuSpXZLiJjGOYw=
X-Google-Smtp-Source: AGHT+IEwO6690xWpUp8eganu8jdYSyS1SMdK/59XsbptKdIVruISq5H+/8nBlBy2UqxEOIc4joWHPg==
X-Received: by 2002:a05:600c:3b98:b0:45c:b6b1:29a7 with SMTP id
 5b1f17b1804b1-46e329c68d9mr110201195e9.16.1758900176802; 
 Fri, 26 Sep 2025 08:22:56 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e42eee0b6sm10038095e9.10.2025.09.26.08.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 08:22:55 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C97925F7C3;
 Fri, 26 Sep 2025 16:22:54 +0100 (BST)
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
Subject: Re: [PATCH v2 03/27] scripts/archive-source: speed up downloading
 subprojects
In-Reply-To: <20250924120426.2158655-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 24 Sep 2025 16:04:00 +0400")
References: <20250924120426.2158655-1-marcandre.lureau@redhat.com>
 <20250924120426.2158655-4-marcandre.lureau@redhat.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Fri, 26 Sep 2025 16:22:54 +0100
Message-ID: <87ikh5i6gh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> Running meson on each subproject is quite slow.
>
> According to Paolo, meson will run download tasks in parallel.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

