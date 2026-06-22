Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEC4CDB466
	for <qemu-rust@archiver.kernel.org>; Mon, 22 Jun 2026 20:01:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wbkp7-0008Pc-Jm; Mon, 22 Jun 2026 16:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1wbkog-0008MK-Ip
 for qemu-rust@nongnu.org; Mon, 22 Jun 2026 16:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1wbkoe-0000Aq-GC
 for qemu-rust@nongnu.org; Mon, 22 Jun 2026 16:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782158419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAS3SRJgEsG/sXLm+WPk6enBbGWkMZFXlLvUcIRtis8=;
 b=A81kJq4lpCCtXHDxAUCwW6a+BN0GFe2RdkLynfxxZwrJGgnTQF6wcu6RapCcWYe0ej2YAC
 oNTHjlxNXGZEZg/N8K0anAI1L/ejsSsS4SQoW3YhhuNZpJAJ0Uh6AfxDajSSvYn/mNiNgL
 8b795KPdeuIqLVZ07NBl66Q5lIn3kFU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-3WCRzesIM7iS5HzsDi8YAw-1; Mon, 22 Jun 2026 16:00:17 -0400
X-MC-Unique: 3WCRzesIM7iS5HzsDi8YAw-1
X-Mimecast-MFC-AGG-ID: 3WCRzesIM7iS5HzsDi8YAw_1782158416
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-36b982ec338so5208140a91.0
 for <qemu-rust@nongnu.org>; Mon, 22 Jun 2026 13:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782158416; x=1782763216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aAS3SRJgEsG/sXLm+WPk6enBbGWkMZFXlLvUcIRtis8=;
 b=L4wLJsFPSRH+aT+xZU7ZhTRTSi0M/Z5pFy108LilClZg4TuKrp1c4z5V5CZ5bqHIZD
 tDVOkUKSqgtFRaHFEhrmXj2VHQqJY9UO2zpyB6kmmcUzqnKak+c+sr5xe3mRmWrgvTam
 P6D7X3ktS/pztm4x0WX0AMbwB0HebKf8KZRu747yXu9wJs4NesegJlM6gVxdc3bS5E+q
 +vrXk6FkVA1AYobIlAoyfqJMynpYrKXrr6FD0BNEoY70/6JpaC5UgprNWINMuNyhExIN
 /6UoTLQCaP+QIFzzjEIpHNknoxkq9i6zN7Qwn8MIRQb0V1na0d/3FP0+zPat/rRG671Q
 ZZqw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUbrCLMlA2szs8M179+Q3fSL9nSNN8fA8oZqxfFwegu6xhzHgKBB3AsGumemoBbxOkKcSDh1bWqLs=@nongnu.org
X-Gm-Message-State: AOJu0YyhzTI/qApxmCVlOOD0q7SQkMEQS3h5pPAXEzLgbH+NHh7WPIjS
 L2GkF9pdxEevU3qrSm1s/3oczlpUz9dKIH/xtYfaWIjno3PloEXtYji7NKehTZvNsEVs00fbjOF
 HYzhPpdS1GVpiAABrg5EzpFtE/n4OfZ7WoYUpeOU7OAriUE9AJDaL9ZTMKVIG2ofuzyWLwe1ybw
 3GflbkDVvrgBebe6QCum2Mysaju3wxlw==
X-Gm-Gg: AfdE7cnUVxXkacCG6qbXAoHNqfgxQCEXWomvtfmdunuG0v86DWvDaRpg+SrR0tvNNIJ
 KWz5GS2WwAXu8TD555Xqfgslxjv0ura7YHTI7zsQCHfUpbgmFRaBahN3arJgj5MHRbrrBaFqfuM
 1zfRst9DYjrepR1zmsEi+3f2UKZYZK6/IqQMPrxCztIOC57JJzopU6K9nPJXyt8KMNZABo9dIOE
 9dbwntbTdTyxk6VSazj6e9AKTsf5l0mORwNO+QG631plO1vlPKpg9XrfpAUohaPl1EtbxMHCWEi
 LZnSTgr/iDwU
X-Received: by 2002:a17:902:d489:b0:2be:22cc:e227 with SMTP id
 d9443c01a7336-2c718c87b90mr172936565ad.4.1782158416342; 
 Mon, 22 Jun 2026 13:00:16 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2be:22cc:e227 with SMTP id
 d9443c01a7336-2c718c87b90mr172936045ad.4.1782158415799; Mon, 22 Jun 2026
 13:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
 <CAJ+F1CKRvSWDOvKC98e_7uyjgJMuXfhOHP83H0s7a=+ZrYxA1g@mail.gmail.com>
 <ajVco512NDPKDPTr@x1.local>
 <CAMxuvazRnZw4PEsdKCEBD8X1ua5LMj5K-k+-oh-J_uvXm5vT1w@mail.gmail.com>
 <ajmMzMAXay65Sl7U@x1.local>
In-Reply-To: <ajmMzMAXay65Sl7U@x1.local>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 23 Jun 2026 00:00:04 +0400
X-Gm-Features: AVVi8CcALnaUygDfXipA9K5Q53AEsopz0M20qNoO-DAXE4d6r2kmvEKjyvCr0e4
Message-ID: <CAMxuvawvb-oueGsgXQsPzAtB8_ArAM+SOtpacrvOGq=4d1F2Bg@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Make RamDiscardManager work with multiple
 sources & virtio-mem
To: Peter Xu <peterx@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 David Hildenbrand <david@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 qemu-rust@nongnu.org, Alex Williamson <alex@shazbot.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Mark Kanda <mark.kanda@oracle.com>, Ben Chaney <bchaney@akamai.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, Zhao Liu <zhao1.liu@intel.com>,
 Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vHWPyx-emAwxcKuebtp6v4WNYbmkRjm8apVajripOvE_1782158416
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Peter

On Mon, Jun 22, 2026 at 11:28=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
>
> On Mon, Jun 22, 2026 at 03:53:33PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi Peter
> >
> > On Fri, Jun 19, 2026 at 7:13=E2=80=AFPM Peter Xu <peterx@redhat.com> wr=
ote:
> > >
> > > On Fri, Jun 19, 2026 at 12:11:48AM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > > > Hi
> > > >
> > > > On Thu, Jun 4, 2026 at 5:46=E2=80=AFPM Marc-Andr=C3=A9 Lureau
> > > > <marcandre.lureau@redhat.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > This is an attempt to fix the incompatibility of virtio-mem with =
confidential
> > > > > VMs. The solution implements what was discussed earlier with D. H=
ildenbrand:
> > > > > https://patchwork.ozlabs.org/project/qemu-devel/patch/20250407074=
939.18657-5-chenyi.qiang@intel.com/#3502238
> > > > >
> > > > > The first patches are misc cleanups. Then some code refactoring t=
o have split a
> > > > > manager/source. And finally, the manager learns to deal with mult=
iple sources.
> > > > >
> > > > > This has been tested together with the Linux kernel series from
> > > > > Zhenzhong Duan [1] for TDX guests.
> > > > >
> > > > > (help fix https://issues.redhat.com/browse/RHEL-131968)
> > > >
> > > > Can the patch 1-11 be queued or are we missing something?
> > > > (RFC patch 12 can be dropped for now)
> > >
> > > Likely yes.. one thing to double check with you before I do: We don't=
 need
> > > the kernel series, do we?  Since when unplug, I expect with the trunc=
ation
> > > approach that this series proposed, KVM will emit TDH.MEM.PAGE.REMOVE=
 then
> > > unaccept is done (?).
> >
> > > Say, what happens if we run QEMU with this series applied, but withou=
t the
> > > kernel series?
> >
> > The kernel series is needed at least for PAGE.ACCEPT. Without it, QEMU
> > will have KVM_RUN return EIO, and finish into assert (while tearing
> > down ioeventfd).
>
> Could you elaborate a bit more on why ACCEPT would fail?
>
> I used to ask the event flow here:
>
> https://lore.kernel.org/qemu-devel/agTjb3M8ElUAlfp1@x1.local/
>
> If AUG existed, then why ACCEPT would fail?
>
> PS: I didn't read a lot of what a Linux guest would do; I know there're
> some lazy accept approach, but IIUC it's only a matter of time to ACCEPT,
> not correctness.  My understanding is if we properly notify these new slo=
ts
> with AUG, then it should be able to ACCEPT?

Yes, it will, but it needs the kernel patches to do it (or virtio-mem
will let the guest access un-accepted pages and qemu will crash). I
submitted a few proposals before Zhenzhong Duan proposed the last
iteration.

> >
> > > What confused me a bit is the dependency of this series v.s. the kern=
el
> > > one.  It seems to use different approaches, but then I don't understa=
nd why
> > > this series was tested with the kernel change.
> >
> > My understanding is that the kernel may perform TDG.MEM.PAGE.RELEASE.
> > That depends on TDX config TDCS_CONFIG_PAGE_RELEASE which qemu/kvm
> > doesnt currently control. I don't know whether this is then
> > redundant/needless with qemu doing discard on the guest_memfd..
>
> The problem is if this series depends on the kernel series, should we the=
n
> wait for the kernel solution be accepted first in case it'll change?

I don't think qemu needs to wait for the kernel to be fixed.
Furthermore, this series is not tdx/sev/etc specific

>
> But obviously I still don't yet fully understand how this whole thing
> works.. :(

I am also slow, because I don't focus on this most of the time.
Someone with more experience and dedication would handle it better.


