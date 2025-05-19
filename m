Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uGvdU-0001X4-Hx
	for mharc-qemu-rust@gnu.org; Mon, 19 May 2025 04:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uGvdT-0001Wv-SL
 for qemu-rust@nongnu.org; Mon, 19 May 2025 04:14:11 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uGvdR-00015O-QO
 for qemu-rust@nongnu.org; Mon, 19 May 2025 04:14:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-600dbfe7b37so2210630a12.2
 for <qemu-rust@nongnu.org>; Mon, 19 May 2025 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747642447; x=1748247247; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wlyzgmPav0xC+DGTNSLhuRNj572X0cqagUIwlypHsM=;
 b=Os+V4V4KcTaipKUUHOSOhnhya/bcvB1bigGHEPD4RQHaQ5K+144Qc/4+6HCJA9FIWP
 6ds9ljj0FiB9qI+/8EtzrLDY3ztb94iW0Jh9voWeQcjg+ZcJD0FDRUMgYmhKIGcdNqmY
 N+HZnKaLJn5L2GdlFimOaSzdEdw7GCDGUuMQVagpC4pP9J5Qu2djX7aBid/2UquaeZnn
 glGY/NlDAUZ/fjIN5ZN261vIPzNo27XXwJhp7laU9ZSr+lzhk/UHzsBTILV7z0dTHWo4
 K3sByWSlDrZXcVL5cuGJvF9w+fUstH0LzUf5rr+klYglFsVgSMjCbPiSSfO2M8BiKVGu
 wVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747642447; x=1748247247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wlyzgmPav0xC+DGTNSLhuRNj572X0cqagUIwlypHsM=;
 b=fs7ulISumVzcH4Y3aXpMViXhLwBRN9mxTbcbJYw0RHh6lvnl1m76uWZgbMLcmGO1rM
 n7zmnDBRUmt4j5JFiSTwZzJG4gYNExTFI74GWyC4fll/pwCQQ5+Vnu07nMF4G0kCaCE8
 5oXp0FQpa8f1Rk3qBFEgF9OuYA0tEiH8ikplk2ZjlKR8NIVxLmk0NkdhgNrYg+Lc84db
 FjX+RisxatQPvOwKUlEg3M1KzPRYMWIdl89fgMWg/j6l0TTkBiQDhwBWpglPtAKdLYia
 cYMLHc++41vHjS6QyeqgCrJ7E+kt2jft3A4hJzr3ulD2Z2vVokgpj6pU+B8+HSmdMnPg
 sYng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeM8U7FlTIu5I+7/YiB/X6xdI7ceTpm0hyOIYo/psTeKrRV4PEF+nAmsQg3hVB9PYMZmrfM2p1ctY=@nongnu.org
X-Gm-Message-State: AOJu0Yxrc21YBOdv4wK/13gmxQJ/O6Q+bpMOCeDZWUOXzc9aFOWmrI8x
 AWH8Aj+Io/qQjjFSerEeMSUh4v48O0uhjxciUfe0GVP3U+XLTqCgVUyB/Sp6b9l6QWoe4Ba8Wuf
 V2Av6lhLrg9ZzysmjPBM2eQGUWzVYvzyQDtUtLx7SZQ==
X-Gm-Gg: ASbGnctK4uvwwTyFCEiITmG8S1UBL8miEwnMkpw9jHZbOIys71tPg1AEv34Ff8HNMmP
 jOqxyTueHCSKj0dVv5N0LhEvkPrJ0FQYJ+/DCQ/L0CJRVvM345PhHL4RHNw/ehtXQWLB5JAiiAk
 CqXta4P0DSFhwSx46e7akycbMkdUI=
X-Google-Smtp-Source: AGHT+IFQ5XsvzpZb3Ean9rZ9b7qPMCseqkiam6szMMy3PyBegkYxIcL+n2up6SblHVbo09o0YBni2shVdWppGZv6PRs=
X-Received: by 2002:a05:6402:2816:b0:5fc:4023:1fd2 with SMTP id
 4fb4d7f45d1cf-6009014a377mr10976105a12.28.1747642446746; Mon, 19 May 2025
 01:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250330205857.1615-1-shentey@gmail.com>
 <20250330205857.1615-2-shentey@gmail.com>
 <340649cf-9348-458d-97e7-aee73c02217c@redhat.com>
 <540905F9-7DF7-436F-905C-A7F225F5E156@gmail.com>
 <CABC6E67-C4C7-481F-BB96-BF60957D7A84@gmail.com>
 <CABgObfbD-yHee4TXKqQ2gw7N8dtuB1wKqPLD5jLKXtJ8hx2xSw@mail.gmail.com>
In-Reply-To: <CABgObfbD-yHee4TXKqQ2gw7N8dtuB1wKqPLD5jLKXtJ8hx2xSw@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 19 May 2025 11:13:40 +0300
X-Gm-Features: AX0GCFtMdP2W5t7OfkRfMWq_pf6CvzOY2cU9BmT0olb9mUgskgQrF-38lBpO8-0
Message-ID: <CAAjaMXadSaKKAk6Vo-AM8RfkH3kQey9LamjC=nEDkYF0d=v47w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/qemu-api: Add initial logging support based on C
 API
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org
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
X-List-Received-Date: Mon, 19 May 2025 08:14:12 -0000

Hello Paolo, Bernhard,

On Mon, May 12, 2025 at 6:32=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
>
> Hi, now that GSoC selection is over I'm back. Sorry for the delay;
> Tanish Desai will work mostly on tracing, so logging can remain yours.
>
> On Tue, Apr 8, 2025 at 10:59=E2=80=AFPM Bernhard Beschow <shentey@gmail.c=
om> wrote:
> > >Currently the #defines contain some holes for "private" mask bits. Tur=
ning these into an
> > >enum without exposing all publicly, and changing the type of qemu_logl=
evel for
> > >consistency, would result in undefined behavior. Or do you suggest to =
convert just
> > >the public #defines into an enum to expose them to Rust, and keep the =
rest of
> > >the C API including the type of qemu_loglevel as is?
>
> Yes, only in Rust.
>
> > >There are surely several tradeoffs and/or cleanups possible here, but =
that's way beyond for
> > >what I wanted to achieve -- which is closing a gap between C and Rust.=
 My main goal is just
> > >to get my feet wet with Rust.
>
> I understand, however there is no point in defining an API and then chang=
ing it.
>
> So we need to answer the questions I wrote a few messages ago, namely:
>
> - the mapping the LOG_* constants into Rust (e.g. whether to keep the
> uppercase SNAKE_CASE or switch to something like Log::GuestError).
>
> - whether to keep the "qemu" prefix for the API (personal opinion: no)
>
> I agree with not having macros such as log_guest_error! for now, or
> not wrapping functions like qemu_log_trylock/qemu_log_unlock that
> would be implemented as RAII (i.e. returning a "guard" object) in
> Rust.
>
> > >>Also, while this is good for now, later on we probably want to reimpl=
ement logging at a lower level via the std::fmt::Write trait.  But that's j=
ust for efficiency and your macro is indeed good enough to define what the =
API would look like.
> > >
> > >Can we live with an easy solution then for now? As you suggest below, =
further abstractions like log_guest_error! can be built on top which furthe=
r insulates client code from implementation details such as the representat=
ion of the mask bits.
>
> Yes, of course.
>
> Paolo


There's also the `tracing` framework
https://docs.rs/tracing/latest/tracing/ that is quite nice for
defining tracing events **and** spans for logs. I find it confusing
that it still ties tracing events with log level filters though
(info/warn/error/debug/trace).

Perhaps this is also a good opportunity to restructure QEMU's logging
in general. As was said in other threads about tracing, most log items
are essentially traces, except guest_error, unimp and maybe I'm
missing a few others.

If we align QEMU's general logging to use log levels, we can convert
guest error logs to "Error" level logs of type: "guest", and unimp
logs to "Error" logs of type "unimplemented". Or, "Warn" instead of
"Error". Then, all trace_* items become straightforwardly Trace level
log items.

Then, all we have to do in the Rust side is implement a `tracing`
subscriber that consumes these traces and pushes them into QEMU's C
implementation.


--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

