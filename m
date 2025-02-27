Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tnhgV-0003hf-0u
	for mharc-qemu-rust@gnu.org; Thu, 27 Feb 2025 12:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhgS-0003Y6-Sa
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 12:28:28 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhgR-0007Yq-7d
 for qemu-rust@nongnu.org; Thu, 27 Feb 2025 12:28:28 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6fd3b31c860so6713427b3.0
 for <qemu-rust@nongnu.org>; Thu, 27 Feb 2025 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740677306; x=1741282106; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gRnxIZxMtrrbRPm4yK9hUiwseHgdagIQ6mDl6/+dzFo=;
 b=q0/AsQTxIVRPLMtIwkmuKe6euv/Lae9HtSGl1ki6yhCAjxgIkRp/rBv+J7k4bG+/Ca
 pCg88o1c3UwKWIX1tUHNLFpeL+TcI2Mpo07d8oQ4goBcSoyJrYWi1bOcDBe3J/w79R55
 SKmG2uA/fRPYohNBqVyIrkI1Fu9nCNdV1/2SilCWFLmQCELf7girhB6ZajNFjltbb4Pt
 5VTl1ZkpEFqUP8cjYRA08tTwcZPAWOJypktJWOsqG2Sp6j6LPTrRtU+zZkl8QwJihZ3l
 wuLrr0cNLMFMnScV+a2MroKnDa6ZLkD2lth4E+aDmfRERmb4nxL94QutnGsW9lL4k1bl
 DcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740677306; x=1741282106;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gRnxIZxMtrrbRPm4yK9hUiwseHgdagIQ6mDl6/+dzFo=;
 b=BA4lbOkhz6VnBn8atfdq8/svlP8inPnrD+FODxOe3paZqbFzc73jgqSpYlxE5RMU6h
 gAaq5scaTIWkKdRxREMu32j0qrCChdg+ac2S01GHouO+zGCG93kh8oloi0Rvq8WBlFTJ
 wMkcpoQMm9n+5b+8lAi85ddnba1GQtMC6qE0FioBJrcW79718VWMSinuD1hwnlX8kx6+
 4eqUwiv65O1lGCyZofsQgcFC3ZfGt1GkM3Rz2iXZZM0qaCdiuNu1GvF3PqRD9K09w7Sa
 HZmM5OifyR+4bQjLmAiTM6lfpn4f+QLOhk0vKl5RopdgGUFMzUGrnrpEkFg12cnS9Fok
 nUsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmDnPyWYFNG7m/oUaM1ThjH/lXEsHPBaBb/gsllHxt3Ar5aOtEHZtiTAXqGrYEfjFHgo/Cjlm7rag=@nongnu.org
X-Gm-Message-State: AOJu0YyEpts4+r4H7hoA2AiHf1tfGSbpiH56WxMXG2qw1zVyVl+dTBbK
 RUjFJT18UzOA8N/uaOUKiU2YV9no5KFvvK3O0FQGUiZKjElsbc2dqgpT1KknA5Pwgki9g2AKiS3
 GhYgbu1oN3sTdV07vcWs+dhV839hZhvmmDEjrcy/ygCjY7V1S
X-Gm-Gg: ASbGncs+6MLGmHIfLuhK6R0p3VFs2fv5hMq5u6k+nmY0YFKg1TRcdPPqWT0yAWgZjJQ
 dy62CZJ9FCNZV/TYJl81IM0Q9GJCaqxatljNC9pazUqPCYLTcxPr6bIh4kp21mH/x3+Llt89iN/
 uKg8cQBogE
X-Google-Smtp-Source: AGHT+IFcKWVFmecCBdeWNOMlxRI3/ZGJkWMLBTh5K9DiQ1qDV0qO5YIAaoN0lcZy4GduZGbLmvBSYT5H+5bVLEkZXLk=
X-Received: by 2002:a05:6902:340c:b0:e60:9d00:ba9d with SMTP id
 3f1490d57ef6-e609d00bb66mr6422668276.25.1740677305854; Thu, 27 Feb 2025
 09:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20250227164538.814576-1-pbonzini@redhat.com>
 <20250227164538.814576-3-pbonzini@redhat.com>
In-Reply-To: <20250227164538.814576-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 17:28:14 +0000
X-Gm-Features: AQ5f1JoRLz6cCGGRc4hHVQJWFYy2jGzkf6KFmLrJsvpHk8prp9P9ZnYGOTcFgn8
Message-ID: <CAFEAcA86CEbeGK6mDju5jyR7JQKB7SfnO4-JoAnyiL2kRNufkg@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: pl011: move register definitions out of lib.rs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-List-Received-Date: Thu, 27 Feb 2025 17:28:29 -0000

On Thu, 27 Feb 2025 at 16:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  rust/hw/char/pl011/src/device.rs    |   7 +-
>  rust/hw/char/pl011/src/lib.rs       | 509 +---------------------------
>  rust/hw/char/pl011/src/registers.rs | 507 +++++++++++++++++++++++++++
>  3 files changed, 513 insertions(+), 510 deletions(-)
>  create mode 100644 rust/hw/char/pl011/src/registers.rs

Looking at this patch I'm sorely tempted to suggest significantly
trimming down the commentary in these comments: it contains
rather more text cut-n-pasted from the PL011 TRM than I'm
entirely comfortable with, and much of it is detail that
is irrelevant to QEMU. I don't think we should be trying to
make it unnecessary for somebody working on the QEMU device
models to ever look at the hardware reference manuals.

thanks
-- PMM

