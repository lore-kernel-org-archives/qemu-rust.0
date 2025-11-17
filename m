Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9F1CE8D6B
	for <qemu-rust@archiver.kernel.org>; Mon, 17 Nov 2025 08:37:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vKujD-0004zq-JL; Mon, 17 Nov 2025 03:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKujA-0004wT-Kw
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vKuj8-0005Zg-S7
 for qemu-rust@nongnu.org; Mon, 17 Nov 2025 03:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763368605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Snd5dpE1c/1fq4z3opAqdonNA4kWh1wLIwKMHTA2U/0=;
 b=Fy4mF88PZ6PB7ISo0ALv0sQwDg6733zgSc1+I04Avf7VJtQ/5tdc1cs+HmHza42wuGtM+J
 Na/pGWSgwYOMOvNgVJTQyKrmv9gd9Hkx8LBQA79K92cE+h8Xd8oWJ3cQvEyyq7APjWzDgf
 uwjr8pZAe2/g1zRiBvaI316GkPg6oWQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-LBKWnfn9MYqfseF_uJUGYw-1; Mon, 17 Nov 2025 03:36:43 -0500
X-MC-Unique: LBKWnfn9MYqfseF_uJUGYw-1
X-Mimecast-MFC-AGG-ID: LBKWnfn9MYqfseF_uJUGYw_1763368603
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42b487cda00so1900120f8f.3
 for <qemu-rust@nongnu.org>; Mon, 17 Nov 2025 00:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763368601; x=1763973401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Snd5dpE1c/1fq4z3opAqdonNA4kWh1wLIwKMHTA2U/0=;
 b=KY5gSz3ydB6vlVK/4gJvFH6z1FomB+fnOMJ7LtlpDJz9NlrQ/xnkbdVWErXwcvrt2O
 qt5UiK7KH9n3ha7SdBe7HA8J+mbWIdkZ88SKefQ/sv4AZZmNCtEDgp9qZYFWYl99AX5c
 m399XmBT8jSaHFUHRWQ+ukagPrnp0bMGQfB4ifxHl1kR65rXfJ7puJQZAi/3MnzlgMVV
 oMonYAlTDjA1HuY7AHbz6s+VW+Nt3mxtqr9Seynt/0qgcMhRNfod42UhAwd//hH7gWqM
 L8+Z60yXriuo99hBZ1VnN/DAUVdAiA/7iM3ZI+QLihSwC3bIS2xlbtR5nM0XI/npgJlg
 WQ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmCyGz/Q1MBQ3Q40jT8ds8faFwenuhqPfQTAAxPEh5DopHFA3nPZIWrh2fpbBhXGVgxmGxoP4Imv4=@nongnu.org
X-Gm-Message-State: AOJu0YyKBZMA08a1Z3aGPL1TZesuuATZZpExJufsjxnoA/IC9Pm/K7n9
 +xfg2/HmCUSdAehGLoTPikI4ynqyMv1Huysj6iGnsApLVs5tcXlndD9Bow/DAMdXaIS0vSEIFkF
 VJJvKSU7Mv/xSPOSLhl3llWazgAvoVjIukIu7DLYWgHPz2Jqy//VNzMKxTmF94QjIy7jjx6EMdj
 M4FVuSeeBF7kPSr8ygv6Mwa/YfW5cnf1d3Zi3kFnuF
X-Gm-Gg: ASbGncsSG5DLAIpRkOr2c7Ee0XFPS2V+n7gCU2N0S1GJk6y1jSVmFDgMA0LmczriXOy
 701Wx+p5zuFoBmafOwjgt01XWH3jvF/Br9BLvgYV85Hoze4gYlwzdFistgMEFOInf67jexw/a9x
 OkhR1w+zy1mLTvnsfqUJ+otRfejyT/nvd0EQlrlPnu689UzvUQ2TFiagQnSP3oE8Xx/RfTm+VCx
 0h+C01EzJQU+TXjPDNq9gMooLCkwqsBeoVuTzrCULcydj/xiuj+a4ABuPfe
X-Received: by 2002:a05:6000:2f85:b0:42b:30f9:79b6 with SMTP id
 ffacd0b85a97d-42b5938a9a1mr11165551f8f.58.1763368601524; 
 Mon, 17 Nov 2025 00:36:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjV3uHWjABRuwu7nZ6NEzQ/NPivrgsyqz/npqBHCRENysdFAEq8JY8mCrT9uX68IVAThPJ1IJu4fWC9fUF1iI=
X-Received: by 2002:a05:6000:2f85:b0:42b:30f9:79b6 with SMTP id
 ffacd0b85a97d-42b5938a9a1mr11165522f8f.58.1763368601051; Mon, 17 Nov 2025
 00:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20251117074239.190424-1-pbonzini@redhat.com>
 <CAJ+F1C+B1amkaS0ZVJZFp42g1e9shdhnmjQYx8CDuv3vQ+Jzwg@mail.gmail.com>
In-Reply-To: <CAJ+F1C+B1amkaS0ZVJZFp42g1e9shdhnmjQYx8CDuv3vQ+Jzwg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Nov 2025 09:36:26 +0100
X-Gm-Features: AWmQ_bncGOB71UIM0goHWRuJ162_nbYEVhvXJWM6uSkwjWkrWi_XMoQziET-hKY
Message-ID: <CABgObfaoTEaOO78+s+ZhqUT62=iS=sVUOFiahwAYkL1EuuW6_A@mail.gmail.com>
Subject: Re: [PATCH 0/8] rust: add preludes to all crates
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -vTc1aVX4gLsRC12iD5zwAB0-w3AvZ8pL-VKbc4T25Q_1763368603
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Nov 17, 2025 at 9:03=E2=80=AFAM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Mon, Nov 17, 2025 at 11:43=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> >
> > This series adds a prelude module to all crates, so that
> > it becomes possible to import from each crate with either
> > of the following
> >
> >    use XYZ::prelude::*;
> >    use XYZ::{self, prelude::*};
> >
> > The latter is used for items that have a "too common"
> > name to be put in the prelude: util::Error, util::Result,
> > migration::Infallible.
>
> In my experience, "preludes" are not so ubiquitous (except the std
> library). The use of wildcard imports is not encouraged, and may
> result in conflicts.

Yes, I agree with this.  On the other hand, we already have lists of
imports that are two-three lines long and I'm afraid that people would
prefer to just import migration::* for example.  While we can block
them with -Dclippy::wildcard_imports, the problem is real.

So I was a bit undecided and went looking for examples of crates that
do have a prelude. I first noticed that bevy has a similar system,
with each of its crates providing a prelude.  IMO QEMU is a similar
case to bevy, where most of the code will use structs from the QEMU
crates more than std, so it makes sense to have them. Futures and
Tokio also have a prelude, and they also fit the idea of crates that
provide a programming environment.

Preludes let you import libraries with a level of detail similar to C
includes.  For simple library crates that offer two-three types it's
not necessary to have one, but as the complexity and number of crates
increase, they provide more clarity.

Another thing to notice is that the QOM bindings work a lot with
extension traits implemented on all types.  There should be no need
for users to know the difference between DeviceState, DeviceMethods
and DeviceClassMethods. Preludes help with that.

> Also, it's often subjective what you put there or not.

Right - for now I just defined what should *never* be in a prelude:
the rule was simply "do not include anything that can conflict with
std".  This should not be that bad, otherwise we'd have similar
problems with C includes as mentioned above.

Another thing that should not be in the preludes without extremely
good reasons is enum variants; Ok/Err and Some/None are the only
exceptions in the standard library prelude, and they should probably
remain the only ones.

Paolo


