Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uEQf0-0006Pa-AM
	for mharc-qemu-rust@gnu.org; Mon, 12 May 2025 06:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEQex-0006PF-9S
 for qemu-rust@nongnu.org; Mon, 12 May 2025 06:45:23 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uEQeu-0007Sf-AS
 for qemu-rust@nongnu.org; Mon, 12 May 2025 06:45:22 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-703cd93820fso38623047b3.2
 for <qemu-rust@nongnu.org>; Mon, 12 May 2025 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747046716; x=1747651516; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ebroI3w1zYhH1qqjQsvXGvrCTExjEBC/y/BTDojvTc=;
 b=bXEGUDs0aBKFnED5K0C4T7cXN+1FBfizZftUC9foqfaLxhXVU96cbUAwtfUXIjJIfL
 g2WrcRmeyLeHgg+SiVuc0Gj3HPJAXBm8C6nrOMYRHc7JCLdmr83oP/5M1hRAVvJ1aIUy
 MQS3jRvqQv5ccQ6YdxO5vFZALun7sREhM32jnviQw3tSrPbDnIz5Lag6Wb4o+ItBXLoR
 Qf9ekH/WdEUe4Bb42mei9BrTn6bqAXr6iPJMCkH9Ho+e+l4vLy0TQXqbRFCoAt26LCHL
 CHgBpPeWklU4c9pk+TNuxQJH+y6pre5kfiNw1kjjr4Ccal0R3HGLx8DD1NaMbI3G0UFQ
 vywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747046716; x=1747651516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ebroI3w1zYhH1qqjQsvXGvrCTExjEBC/y/BTDojvTc=;
 b=OBqIdR4Cm6NHYbCBK2kkkaRRvNMoOPWV5ApniufAbh6N55egK9tYBbADdqf8PYk0lc
 qUz8pL2ZVx4QaiQPnQdn0eU0gLQIXgC4yoHgFfSbpmVPPOfmo0y1Ocsoj2QsIrfcG/ED
 mzO3HJew6sB/CTFBY7PRxP/7SJE04ZfppF6xo8UXORbN8JKrxfwgNzBO44A48J0PPOLj
 uptp0k1qaBMT4RoEQp3yyFPd85A69YjPLA2lH9gVIkkzyOp/pg1VfVYdolzzuH48X4sL
 jIJceL8pt3a4EBppk9litF7CNLyf+4bycfeoUgxDRE+xAta9EiPZYj9ZMleNNWZb3Nbw
 oQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCWRWLUQB9gImqAxb6T+hu78Jjw1W8ZkIXX2bFp3UR3DpGSsHC5+CrjO5azH569sz8Kk+20QdupCQ=@nongnu.org
X-Gm-Message-State: AOJu0YxiEZHRU1BjijlLoff/PtB1FWvX+cKdq/VgZJA50ciMuf553cdi
 TmClS39kBC4/ZIyvlx8vC80U/Ogj9SoGOUndxaOd2b/+pF2tMeoabfm8scX6DnNlznp5G+YM8DP
 WhY9J+DZ36sqIS9y0EqY5xfbsQw9iRloFaLeuRw==
X-Gm-Gg: ASbGncuzDLPH4Dchif2qf/zmH1an+iKkx+aABRGYnNgEgT0fK8jpsgSChkemK7mNG6H
 JRBKZNXP+oYA+Y0xbSIHtH0/MVT///vIJAO0MPhGIcxHxevkFx8ViHJi+V3I305VGPPm4uSSJD9
 YCoL14TXN8a4IeWMy9QiHSTlCQ5dpyG7HaF6hgvlYizlNg
X-Google-Smtp-Source: AGHT+IHI1npt/77n/KYpBczuKF4LNPFY42l+Z67FFudnuCWp8tIphO/R6Syu3GX9aBjQXH9Sdgt11t9hqiZzSpMl3l8=
X-Received: by 2002:a05:690c:4886:b0:6f7:ae31:fdf with SMTP id
 00721157ae682-70a3fa25325mr150802637b3.12.1747046716096; Mon, 12 May 2025
 03:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250330205857.1615-1-shentey@gmail.com>
 <20250330205857.1615-3-shentey@gmail.com>
 <Z-pdzUBa4CrBourR@redhat.com> <318E2A13-A163-434B-B18A-8A260CD3BC27@gmail.com>
 <Z-07WTw4PHHKhfxU@redhat.com>
 <CAFEAcA-_eaPF16f5rBhPar_kHpW49JZ4fQNPGUtd3qbNs+ktJA@mail.gmail.com>
 <aBzmfKzxIfdtzdGI@redhat.com>
In-Reply-To: <aBzmfKzxIfdtzdGI@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 May 2025 11:45:04 +0100
X-Gm-Features: AX0GCFvox1OEHmdrqm8hzffF0ZKRZQ3ZzCye8NTwrcJwldOufUIAe47qxsl-Bn4
Message-ID: <CAFEAcA-ukBLdZfJDQYV=BcYv2gFUqUt63pad9n6B4JSD1ZL2oQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust/hw/char/pl011/src/device: Implement logging
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-rust@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-List-Received-Date: Mon, 12 May 2025 10:45:23 -0000

On Thu, 8 May 2025 at 18:14, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Fri, May 02, 2025 at 05:48:02PM +0100, Peter Maydell wrote:
> > On Wed, 2 Apr 2025 at 14:28, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > > On Wed, Apr 02, 2025 at 09:33:16AM +0000, Bernhard Beschow wrote:
> > > > Am 31. M=C3=A4rz 2025 09:18:05 UTC schrieb "Daniel P. Berrang=C3=A9=
" <berrange@redhat.com>:
> > > > >General conceptual question .....  I've never understood what the =
dividing
> > > > >line is between use of 'qemu_log_mask' and trace points.
> > > >
> > > > I *think* it's the perspective: If you want to see any issues, rega=
rdless
> > > > of which device, use the -l option, i.e. qemu_log_mask(). If, howev=
er,
> > > > you want to see what a particular device does, use tracepoints.
> > >
> > > I guess I'd say that the latter ought to be capable of satisfying the
> > > former use case too, given a suitable trace point selection. If it
> > > can't, then perhaps that's telling us the way we select trace points
> > > is insufficiently expressive ?
> >
> > Yeah; you can turn on and off a tracepoint, and you can select
> > them by wildcard, but there's no categorization of them
> > (into eg "this is basically the equivalent of a debug printf"
> > vs "this is something that is a guest error you probably
> > want to know about").
>
> I wonder if there's any value in enhancing the trace support to
> let us tag certain probes with some kind of "severity"/"level"
> concept, such that when the 'log' trace backend is enabled we
> can wire them through to the logging backend with useful
> categorization ?

If we wanted to merge the two subsystems I think we'd need that;
and also a "kind of log" tagging.

> >                        There's also no way to say "turn on
> > this logging with one switch, and it will print multiple lines
> > or more than one thing" (at least not in the spirit of what
> > the tracepoint API expects; you could have a trace_in_asm
> > tracepoint that took a "%s" and output whatever you liked as
> > the string, of course). And debug-logging is more documented:
> > '-d help' shows what you can turn on and off and has at least
> > a brief description of what it is you're getting.
>
> IMHO the documentation benefit of '-d help' is somewhat
> inconsistent.
>
> I tried a crude grep for different usage of logging
>
>       2 CPU_LOG_EXEC
>     122 CPU_LOG_INT
>     103 CPU_LOG_MMU
>       6 CPU_LOG_PAGE
>       1 CPU_LOG_PLUGIN
>       8 CPU_LOG_RESET
>      10 CPU_LOG_TB_IN_ASM
>       4 CPU_LOG_TB_OP
>    1715 LOG_GUEST_ERROR
>       4 LOG_INVALID_MEM
>     753 LOG_UNIMP
>
> So the overwhealming majority of usage is accumulated under
> two "catch all" categories - "guest error" and "unimplemented"
> with no ability to filter - its all or nothing.

True, but both those categories are for log messages that
are "in normal operation never happens". So it's not like
the message you're interested in is buried under a ton of
irrelevant logging.

> We ought to be able to do a better job at documentation the
> trace events than we do today, given we have them in an
> easily extractable format and can associate them with
> particular files easily.
>
> The 'qemu-trace-stap list' command can list all available
> probes in a binary, but it only works for the systemtap
> backend. We ought to do better with other backends.

The '-d' backend also lets you list them all with
  qemu-system-arm -d trace:help

> >                                                   For tracepoints
> > you're hoping that the name is vaguely descriptive and also
> > hoping that the device/subsystem/etc named its tracepoints in
> > a way that lets you usefully wildcard them.
>
> Yep, we're somewhat inconsistent in our prefix naming
> conventions. It would be nice to try to enforce some
> greater standard there, but its hard to do programmatically.
>
> > Also, the qemu_log() logging assumes "we're sending text to
> > a logfile, we can format e.g. register dumps and disassembly
> > as arbitrary laid out plaintext". That's fine if your tracepoint
> > backend is also "we just send the text to a logfile/etc", but
> > I don't know if all of the tracepoint backends would be so happy
> > with that.
>
> I think emitting multi-line blocks of text probably ought to be
> considered out of scope for tracing. The 'log' backend is the
> only one where that would be a reasonable semantic match.

But it's one of the key things -d does: "-d in_asm" for listing
the input guest instructions is a super common use case, for instance.
If we want to merge qemu_log with tracepoint logs then we need
to have some answer to this.

(Of course, we could leave the two logging/tracing subsystems
the way they are now: there's not really a super strong
motivation for refactoring everything to be able to drop the
qemu_log stuff.)

thanks
-- PMM

