Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uERwX-00052D-MG
	for mharc-qemu-rust@gnu.org; Mon, 12 May 2025 08:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uERwQ-00051S-Cf
 for qemu-rust@nongnu.org; Mon, 12 May 2025 08:07:33 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uERwN-00012E-UD
 for qemu-rust@nongnu.org; Mon, 12 May 2025 08:07:29 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7099bc957d9so35868017b3.0
 for <qemu-rust@nongnu.org>; Mon, 12 May 2025 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747051645; x=1747656445; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fqp145TTf6c9TZdU4feno64yxxmj0fOkAJQlbQnv7Ks=;
 b=VE6Yw73xluT0n8JY8nwhJToiS4+UgOoH8n8X1DV6V5WyXTWE3GstN4sxeSalkU8vYE
 acF698gvEZvRbocCdG89QMqCH0lobPhBxl3Sq2nP7SDD63EBml5zyEqcObrq3sfHs268
 vYtCNZCXxs1ii5vTlR31HB600mLrwS9/aM1sp0K0I61FdKgOOtWceDVITQx8Eopcm7KN
 1NhEAyQW0ETHUc7RRHWxcCSdl5ZQEhsrWNXFvEcOkl89lo5DwtWCdOlLqhawb29HV/fE
 +Dj/Pu/1WZQscMhjsm/+VkLOAhGLrcpvODLZgZ2jnHeqVDQ0TsuyBkOj4/06J8WDWsGu
 /bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747051645; x=1747656445;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fqp145TTf6c9TZdU4feno64yxxmj0fOkAJQlbQnv7Ks=;
 b=vj1ccyyT+ny3FA9DlAMpfhPj4HRWyLjTYmMlxUsNGaSkctIjO5SNzc/9KAkxIinySL
 MRzo5qku26/K1jyS4vcX2baHC/Q3I1/JZZbwF23oTxT3jLsf+wvs8fZwF+nKOAJuQckC
 RLhsr5+3pXIgc/A4pLWhKRuZVWrNABKaVvyQ7JLPvPh3VPG+XO8O61COrrIJQ2pPxEvy
 hzq8ILUJa0LOkECilnl3upiPWTR8ESl7jchNLyzN53FKhNc2vQrwdTJ1GXlqCKJfMKNr
 YUkBNESqoI0A+7pVD6c8JvL0BQHJfSOieyZ2oGGSgLjY2S1TtosIG0hzz/D/LibrOjBm
 tb7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo68c4Fjys4MHH5luez5I77a+ZUmMLszqxH1ivUzQeXtMEAezgTuMVG2P8XnbFUKgF9jEQFDnosmA=@nongnu.org
X-Gm-Message-State: AOJu0YyIhXH6DUl7E+AJbnAsYfwZgftukavISkcP2GAeyOglVZx0Xhao
 6g1+BEeSc0t8TuxOERCylILAzNOABsFxBxsElbFyrrqcmDwamTbY/BJaQl78VBH7YeQ2BrxuIQ+
 Y6VogeF9f9OcN91ENVvWxHJSombR0/RIarO1qLA==
X-Gm-Gg: ASbGnctLFFqhCzHDSj1LARuA/EMiGf/bTsim4QufVu1k+jKNdmNoL4jZOKAIRHk5xZS
 EBdlZsKKdwNxjQudFy9xUN0GkCSVPjdOUXENF9z5UOiV/bjNbE2SyoiWoFjsZ7yBeyxk6Eeb/pG
 0NTrzCWXuAbSGKElgGF7T/lMjnqzbVaY//sg==
X-Google-Smtp-Source: AGHT+IGnLn6thlLRWZizXFYbH6qxglVGVckUXnFcSAmzAk21Zga/nGvxh07sGsqYj0gEPIWEvOUye9pubD1pSgvewe0=
X-Received: by 2002:a05:690c:4d46:b0:703:c3ed:1f61 with SMTP id
 00721157ae682-70a3fa4337cmr177144197b3.20.1747051645153; Mon, 12 May 2025
 05:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250508082943.446512-1-pbonzini@redhat.com>
 <20250508082943.446512-2-pbonzini@redhat.com>
In-Reply-To: <20250508082943.446512-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 13:07:14 +0100
X-Gm-Features: AX0GCFsUURBzTh1Uds1AdcIFywPA33o5YP_BcBjkBNx113F-Hd-x5y2UtfGdsfk
Message-ID: <CAFEAcA8-A5D-ALLdTuP-urYF4SeVE5MtAYacRmWiMDC7ZshiQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pl011: Rename RX FIFO methods
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-List-Received-Date: Mon, 12 May 2025 12:07:33 -0000

On Thu, 8 May 2025 at 09:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> In preparation of having a TX FIFO, rename the RX FIFO methods.

Is it worth mentioning in the commit messages of these
two patches which the C commit is that they're matching?
For instance this one is 40871ca758cf ("hw/char/pl011:
Rename RX FIFO methods").

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

