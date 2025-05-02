Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAtYk-0008UE-O7
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 12:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAtYf-0008TO-0j
 for qemu-rust@nongnu.org; Fri, 02 May 2025 12:48:17 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uAtYc-00083S-U0
 for qemu-rust@nongnu.org; Fri, 02 May 2025 12:48:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e75608f945cso1117080276.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 09:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746204493; x=1746809293; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iglvjjFZCtDTPF4Jg1I9knCUgQ1snHxkQwUXNZrdWwM=;
 b=dq58hkSLy/yqbPTKX8L9JW7Nui4xYTsH9TWJI5Efz7WbCXHqXrBtnOUDlg34Bhp1eW
 4TE0aqWTm5PjCjBQISpPIXQS9OBQG+YJ2goMe0brCU9HXxpLkexdJ7fy2OvFvbDRbflP
 tgp9ZNNBFapdMIh2dknxzjYCc2dW0wfcUf0fGs1isXSLLo/dHSTDEIuq7vKqRhaENsW/
 y7kRlmecuXWY6M6rEq182H5gTlZg81GzhFL8XSUgSDT0I4dkYT5bXrbpS/bmwdqRa3wo
 pLOe0AFx88VstRaTr1+5OXHHirtG364apVg7VbPmqJtoz2zBrv+zZOWqadrSMRcSLlXX
 cItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746204493; x=1746809293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iglvjjFZCtDTPF4Jg1I9knCUgQ1snHxkQwUXNZrdWwM=;
 b=JGFDzxv9bSDWW1XmU+zVnJ4DG6lu2NJVo870lnLpDcktsKxGdrKQUhATmgCiX9aQg6
 XDJB27S1D+uoz0KFKH9P49kUqvRsiGDd31TieloMJGCiXgN2f2u5et4bQ+kDu3QJg5XT
 WcqKQL3o4+ZHbu6auA8e9sYn5610jDN75bMotk4CcaOPYBkVUD4JMSN9NBFkVf8BCo0b
 qoX29ToUeNZm8mKWSWCKSyNsUSCkjx0O9502FYN8UtX1gmAePca/0waNnbye0CoYOPUD
 hEqrxwKBzPmaa+OhTkAu3BuqsudEKTVdgEtJd1pok9DTjYnhoJ3OypFAPQE7mqlXi9BJ
 RSfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKtU3b/zgx0WiXeLpPxo8GHTzBQq98SkRNABDrOViRx9vGD1qLD76ONejVjUo0Wqcvse0U7J+TFcw=@nongnu.org
X-Gm-Message-State: AOJu0YySD5yV+DImLwjcbD3f5zJNdiy22o2CXYRWavnwUb9rumYBzmZQ
 mJEQD6zNRjpkf1LATXcZvsIaI1nWMywCwlQS9p5maC/Fka3Hea3WyXuD1jIAq5JgkaCx47Su4cG
 G4lErs8QOOq/LmmsKv1EIT7MLN7y421f79tj6jw==
X-Gm-Gg: ASbGncsft/ltsx3r1mO4N14zwx4hNgK8AaqJi0uHZsclowbk0NGJ+kB9zQdjbJ+8cSR
 N69lwzBLec1TfBHoKxNzl0O7ntt3/rC8+XeLOlaUYcKgZgwUHGXgVOBRz57HUWBpIeGTB7s/Vhc
 LEj8hxZAOSldyUDRq3H+XmQeLaew+XPg6+lw==
X-Google-Smtp-Source: AGHT+IG/CykXw4Z4KB8lba2JmLeszRv/c8xBv3P1os8lk/nrvqn8px5qc4rNv61oHRiWTQwM2tT9hnmGbYVqrSRqDmY=
X-Received: by 2002:a05:6902:102d:b0:e74:f068:4df1 with SMTP id
 3f1490d57ef6-e756557bb23mr4678755276.22.1746204493399; Fri, 02 May 2025
 09:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250330205857.1615-1-shentey@gmail.com>
 <20250330205857.1615-3-shentey@gmail.com>
 <Z-pdzUBa4CrBourR@redhat.com> <318E2A13-A163-434B-B18A-8A260CD3BC27@gmail.com>
 <Z-07WTw4PHHKhfxU@redhat.com>
In-Reply-To: <Z-07WTw4PHHKhfxU@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 17:48:02 +0100
X-Gm-Features: ATxdqUGP4hgFxPc-D-fAywPIfuF2mfKE4VajHVlMt_HICWPwsOAT2kZ0nB7tC3Q
Message-ID: <CAFEAcA-_eaPF16f5rBhPar_kHpW49JZ4fQNPGUtd3qbNs+ktJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust/hw/char/pl011/src/device: Implement logging
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Fri, 02 May 2025 16:48:17 -0000

On Wed, 2 Apr 2025 at 14:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> On Wed, Apr 02, 2025 at 09:33:16AM +0000, Bernhard Beschow wrote:
> > Am 31. M=C3=A4rz 2025 09:18:05 UTC schrieb "Daniel P. Berrang=C3=A9" <b=
errange@redhat.com>:
> > >General conceptual question .....  I've never understood what the divi=
ding
> > >line is between use of 'qemu_log_mask' and trace points.
> >
> > I *think* it's the perspective: If you want to see any issues, regardle=
ss
> > of which device, use the -l option, i.e. qemu_log_mask(). If, however,
> > you want to see what a particular device does, use tracepoints.
>
> I guess I'd say that the latter ought to be capable of satisfying the
> former use case too, given a suitable trace point selection. If it
> can't, then perhaps that's telling us the way we select trace points
> is insufficiently expressive ?

Yeah; you can turn on and off a tracepoint, and you can select
them by wildcard, but there's no categorization of them
(into eg "this is basically the equivalent of a debug printf"
vs "this is something that is a guest error you probably
want to know about"). There's also no way to say "turn on
this logging with one switch, and it will print multiple lines
or more than one thing" (at least not in the spirit of what
the tracepoint API expects; you could have a trace_in_asm
tracepoint that took a "%s" and output whatever you liked as
the string, of course). And debug-logging is more documented:
'-d help' shows what you can turn on and off and has at least
a brief description of what it is you're getting. For tracepoints
you're hoping that the name is vaguely descriptive and also
hoping that the device/subsystem/etc named its tracepoints in
a way that lets you usefully wildcard them.

Also, the qemu_log() logging assumes "we're sending text to
a logfile, we can format e.g. register dumps and disassembly
as arbitrary laid out plaintext". That's fine if your tracepoint
backend is also "we just send the text to a logfile/etc", but
I don't know if all of the tracepoint backends would be so happy
with that.

thanks
-- PMM

