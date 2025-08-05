Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4D9C87FD1
	for <qemu-rust@archiver.kernel.org>; Tue,  5 Aug 2025 16:48:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1ujKph-0005jg-4G; Tue, 05 Aug 2025 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujKpe-0005h5-8t
 for qemu-rust@nongnu.org; Tue, 05 Aug 2025 12:48:10 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ujKpc-0002h2-DB
 for qemu-rust@nongnu.org; Tue, 05 Aug 2025 12:48:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6153a19dddfso9008139a12.1
 for <qemu-rust@nongnu.org>; Tue, 05 Aug 2025 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754412486; x=1755017286; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gia9WWHTlTGh2REw9LUgcLe3DCJNJ0VnYRNN2Dja+nw=;
 b=NgK+8Y6V/XmMNBCl6Yl0Y9bTGs5fbtP8V3ZgoOfyYTSKxqlt0zu3B7cPHVETQZHE+P
 UNVP4I+mJp5JXycPz+0KoYjTDMQwQZue5CRWARk9uV2qIL7uUB3wkoSSfBHWbaP8I61e
 UXE6BcuA+daaXJL+vLVEI15lv9wQWkaB/bEaLtRy5yvKsJpJmVN9SYiPQ/PFBppydogu
 dPBA8neuZcjGJRv6jaJHxmjjBqMgoE5UjKtf1IUWPp4m+EqE3pZHKFSxA1/lS6apg45w
 nTk+nrN6RiqGDc1z9ZgKSUyDAd3XWrCNf4tkSn2eIcIqeySlWS8dYwwgwEOZegS1j1bk
 bjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754412486; x=1755017286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gia9WWHTlTGh2REw9LUgcLe3DCJNJ0VnYRNN2Dja+nw=;
 b=P3B6BAj747KstqDsb9uVnryI5l7BorzTzr41QuqG7bSo84pbWi3bLSWR8DJp2qkoxv
 ZE5hKbdDLr33kHiaZcke7hBCSVkgM5nLyoLe59gcRfr96ZfIqXvzrgMiiNkm1x1dO6Sp
 sX/lgmDi6sOJDlyQmvEOMsmuCitd4V7yrkFZ2JDFhgWyDyRJg2A6PDWGVAzAxEegB0EP
 WuLdPaPgvawSpP6Jv5khKoNDkyT8aSjxuVGl6vE75CWjSYOAuYJL5nzAWl7mSemsXCWo
 ORYrhruVZBS3+jWHyy21Z3gbLPARY04nFDNcV4Ud6DYeuDTkpubyqc1xF6TlidoW5Ivc
 Wbig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbesEE8zM/7I02ZV7Owyc0QnIkCCbtl7JOj8bEyaZWMBr8EI+LudWwZw7ljF/lFWwblzUVEzMP1Rk=@nongnu.org
X-Gm-Message-State: AOJu0YxWZrYyodxIXxEqJJWx6BIbWk1APldIvHd4NVmvQSmU/7y9Si+e
 /8zQbWaZ/3rOclzJ0KQQi/L8WY1jyNWsbyU6eqJ7mbNh9zuQCH82U9CW+RHXJCLyN+JVM+rmFCl
 TeCbteq5Yv2DVInBMtk3zON/TY2nPktibVjwBnDVo+g==
X-Gm-Gg: ASbGncvWus658SzkBzzEX411sQvLA661KZCl9DZlUfaBBqYqtiO5tP9SgcmBmnutP+U
 b0L8s8zq088nAEC3I+eK9YMtaDAqBDzVCOqfmU4NqulkZIuHtobQ9CWjm9x6MPNDcUSO4czgGY3
 zferPrJKc+Hb9kmtGN/6hxtbqcZ0ZkarYSoW7xuTSHBkTBMpqj1BXE422B7Ie5ii3qY1TJEON/w
 +4mtO7l
X-Google-Smtp-Source: AGHT+IGnL/HcRWFBIfD8KLABlRY1YA1o5/hiafLxqrIew4eNn/LJ/t/8mUh56lZqgZSuPoImtz83SWtehiVc6G45wno=
X-Received: by 2002:a05:6402:68a:b0:615:7047:4efd with SMTP id
 4fb4d7f45d1cf-615e6ed288bmr10328062a12.13.1754412486512; Tue, 05 Aug 2025
 09:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-rust_trace-v1-0-b20cc16b0c51@linaro.org>
 <aJIrpoEhrl7aLBMg@redhat.com>
 <CAAjaMXa6ManykYJJk--vNZT7oeBW9UR2v6WixaaQ8LUCSjy9Ug@mail.gmail.com>
 <aJI0mr5HDgtE9HIc@redhat.com>
In-Reply-To: <aJI0mr5HDgtE9HIc@redhat.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 5 Aug 2025 19:47:39 +0300
X-Gm-Features: Ac12FXw5z5QThovNUyMLGoZ4mp1RFpkiy0tJxM2eWnjb0r7jbcAf6BKdQIEyBDs
Message-ID: <CAAjaMXZ0Dho+5FSyc4zkOZXZT6UvHtjgmpj6_0QZQcH_AD9=VQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/5] rust: implement tracing
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, Aug 5, 2025 at 7:43=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Tue, Aug 05, 2025 at 07:25:39PM +0300, Manos Pitsidianakis wrote:
> > On Tue, Aug 5, 2025 at 7:05=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrang=
e@redhat.com> wrote:
> > >
> > > On Mon, Aug 04, 2025 at 04:47:13PM +0300, Manos Pitsidianakis wrote:
> > > > This RFC series contains some simple patches I've been sitting on f=
or
> > > > some months to allow tracing in rust devices in a similar matter to=
 C,
> > > > only it's done via a proc-macro codegen instead of using tracetool
> > > > script or equivalent.
> > >
> > > IIUC, this series is only emitting the traces events via the
> > > qemu_log function, and so feels like it is missing the benefit
> > > of tracing, vs the traditional logging framework.
> > >
> > > In our RHEL & Fedora distro builds we disable the log backend
> > > and enable dtrace, so that we have fully dynamic tracing and
> > > observability across the kernel, qemu, libvirt and other
> > > components with dtrace integration.
> >
> > Hi Daniel,
> >
> > Thanks for the insight! Do you have any points where I should look at
> > the trace implementation for how the different backends are supported?
> >
> > So I think there's already work in progress to support proper tracing
> > for Rust, I only sent this as a temporary fixup to provide some kind
> > of parity between C and Rust implementations until a proper, better
> > solution is available that can replace it.
>
> Can the rust code not easily consume the existing functions in the
> trace.h files generated for the C code as a short-term solution ?
>
> It would not benefit from the code inlining in the same way as C
> would, but it would at least give feature parity for tracing with
> all the trace backends are available.
>
> Then, we can look at optimizing with a pure rust impl of some
> backends at a later date, to regain what we lost from lack of
> inlining ?

It can, but we'd need to add extra intermediate steps to convert the
trace headers into Rust equivalent code, so it's not ideal.

I tried to generate code exactly like the generated trace headers
though, so I'm not sure what is missing to be honest (hence my
previous email question). The generated code generates TraceEvents and
registers them with trace_event_register_group. What else is missing
to support e.g. dtrace?

Thanks in advance,

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

