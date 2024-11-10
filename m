Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tA9je-0000Ha-JW
	for mharc-qemu-rust@gnu.org; Sun, 10 Nov 2024 10:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tA9jc-0000Gv-B4
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 10:20:16 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1tA9ja-0002xf-Ki
 for qemu-rust@nongnu.org; Sun, 10 Nov 2024 10:20:16 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ceca7df7f0so4697896a12.1
 for <qemu-rust@nongnu.org>; Sun, 10 Nov 2024 07:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731252013; x=1731856813; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ol776bEBnJ10lxdse6Fhge0PL2A/xzpKCiIBQp8DFg4=;
 b=S4zo4dMSSmlD8YQWneJsMyp1kO6kyglssczgFbmg/FxseJ8o4Mgi5vx6KvtdKK+yAb
 v+kjSGPCel/kDQtWiFEN8u8zYipOPSpTMFl0Opx+pPAyTuu4gkkToNFv4Cpmm8i9iNDE
 g8s+GYF7IRjHE9iIW2M6YKIfQ6sOcUO9okifWtxOem7XprfmW3NIOgboA57mxzve9WBz
 S8xGXtNIWiEmm7k/NQr+SA5xuGZ+byRnbwTAFJKgkP0c9dU2PnsprO0XZ0d97M0gppbJ
 FlUjnNyY1HGRP91rInnn6dM256OvXOVt3FcO3e58GI524TQ4Z36Yyg9TyZjYlQnUbufU
 KqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731252013; x=1731856813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ol776bEBnJ10lxdse6Fhge0PL2A/xzpKCiIBQp8DFg4=;
 b=u1Xulf4CKje/AIOL/SBkZtbJ6u2+6D/NJL4AD+cZPA0t3i6ta9TbI73s+h10ye6SPk
 /mDXZpAlUskXm09nh8Fe4s2v5hzP/4WjBfRuV0MyTzVN/ISNMoNHEubDAgY/B+/EW+ni
 LOJjxCC3bYzKMEmFcyrySbIT2oMcgmiGAyTfFq9Zk/VL9PpJNnjM5tqS4iMcrV463t80
 jMWqeSaNAkwWQ4CGY0sJw3p6gVLmr78+kcOXCW0M5p2mROTTenCf05Rtuhi4TOeKQq43
 /AjLkCLhv8blDnMZrEJQJkUaYgZiq9IOi1m62sFQwrjMsQR4vjP3TjB37lOEJ8obXuE5
 wXXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM5VabQiWo1DIZVci/1UZ/m643PsSBDspwm8dAHJsRQMvXstDCRjxJiQAWrWvrt7RfyfIch4uMZIs=@nongnu.org
X-Gm-Message-State: AOJu0YyiAU7kMzUzeIlwDyt8DUv2+L4x8CeiccinMBIRz78EHeT+oxab
 iqNRP9bqRmqRRS2kKL/Bc9t6Rc+4m5RU8c1o7xgxa9COD92A9eRAwRTw9jn3xDtNw7Ivws2x/sA
 ONrpfxSnQRZER0qlfNmf2cfg3HqQM7Yzy6YFaxg==
X-Google-Smtp-Source: AGHT+IEDaI7WiwzE18+zhzrPM7p8PihVlxIyNedxMApFB1dg8GaLEKJe+dFkfy/iZdWdqO0n7wZN6SnbrPNvTVGkH+4=
X-Received: by 2002:a17:907:9486:b0:a99:4f40:3e82 with SMTP id
 a640c23a62f3a-a9eefeb2bacmr817987566b.7.1731252012435; Sun, 10 Nov 2024
 07:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20241109-update-maintainers-file-rust-v1-1-f4daba6f782f@linaro.org>
 <aa360d5f-b4f2-4a61-a5b8-decc87a97a7b@linaro.org>
In-Reply-To: <aa360d5f-b4f2-4a61-a5b8-decc87a97a7b@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Sun, 10 Nov 2024 17:19:46 +0200
Message-ID: <CAAjaMXayR_Ugkz76OuYe97tEKvHuuJA79f71GJA=zt8L=ESb2Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: CC rust/ patches to qemu-rust list
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Sun, 10 Nov 2024 15:20:16 -0000

On Sun, Nov 10, 2024 at 3:59=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 9/11/24 19:29, Manos Pitsidianakis wrote:
> > As of CAFEAcA-ZQuyGTtG-vhRTEwpz0L4cpimNxkKix45Yw6gVHXozRQ@mail.gmail.co=
m
>
> "As of [*] ..." but I'm not sure about the usefulness of "like
> qemu-block, qemu-arm, qemu-ppc etc but", maybe scratch it?

I definitely find it useful, for what it's worth. It's an all
all-encompassing topic, like block or arm, and some people are
interested in keeping an eye on those topics if they are not CCed on
the main list.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

