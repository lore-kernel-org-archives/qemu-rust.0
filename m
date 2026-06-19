Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1473CD4F26
	for <qemu-rust@archiver.kernel.org>; Fri, 19 Jun 2026 15:14:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1waauu-0007qg-W0; Fri, 19 Jun 2026 11:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1waaut-0007q3-5t
 for qemu-rust@nongnu.org; Fri, 19 Jun 2026 11:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1waaur-0001Td-N5
 for qemu-rust@nongnu.org; Fri, 19 Jun 2026 11:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781882036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WY9zXhKzVITuA8MGsWDx4DYJSZbSzt5qLXb4eP7myuY=;
 b=cM7JWK18WjIhiX2Oo4OtcBC51Htf2/2ckJRHQYtaknX130fckYbRbnpowO+iX1I1N9/Hxq
 2d/AM0Y9KJDJFFL4Q8CXjEL4uUZdwb9b5OvHkFxnbREWuLMNNOOdbOc6jF5Pme3GsthtsJ
 J1AlUzZhLZ4X0dwp+i0PnKT38akSQns=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-2cekFhcYO5Koc3ftAOUX0w-1; Fri, 19 Jun 2026 11:13:52 -0400
X-MC-Unique: 2cekFhcYO5Koc3ftAOUX0w-1
X-Mimecast-MFC-AGG-ID: 2cekFhcYO5Koc3ftAOUX0w_1781882032
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517615db531so64062971cf.1
 for <qemu-rust@nongnu.org>; Fri, 19 Jun 2026 08:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781882032; x=1782486832;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WY9zXhKzVITuA8MGsWDx4DYJSZbSzt5qLXb4eP7myuY=;
 b=QmxnZ8BM9+nRsCAL3fHL+J53ddgiw4DtQhi0G7hKYs0/xilsgAHerII1jiNMeyH/sK
 EplakD/olFj1xyi0oxdyXdcvzB8IrmMU4eTk7uFhpCiCzQ9LBHCX6TVbH7QZJWIS9oWl
 nLasDRQbwzU5lEobNDYZTIS8tU8VAYKYqN5m0lYOPRciYJqfavcnlTIxXVoI3T5AIXbC
 k6/QQ9CuvLwOPs2S+NVLhNOvxK/tw3rtVzpY+JT4dRrX7xwd5i4iHLRv4yKTS0r5IYys
 GloAAXFNdHOj3trU7rEDaZpgcPfCZ/Q4TltAqYsuf3iJnS2p9pjCptkd3z9bf4LSeKWq
 UOhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/M2x8gtJsXLOnHbsqUWurgyxKPHHNdU1YfY7wkk8rf90ppaWzliUIl72so0qmlWyO2ol8YAEIGce4=@nongnu.org
X-Gm-Message-State: AOJu0YyCk2ree9CQhyfv7lNy2TDyLxAWxI74Wck4MPC4aV1V7elCvFwG
 qWzdZOGDyWNg20v+Ep5ou5RFhE9IR7mf8vFxBAj4esUDKCxrl5E75K2EGK55IcNQoU/qRikTny0
 3iXNyupakX9+EKIZIneG+b+qajpkMU1lEqdDyOrm0wOEIA2xQRKhh6dA=
X-Gm-Gg: AfdE7cm5KJUx48qFhUN8MtHvaMkBmijjKSO+2QlWd5cL0arUQqR7t7PwyNw3CaA0nT7
 cMNQ7ZU+izP/eyptogcyg+xOKahkESUzAf/9StKaGuZIzbhOAbDbqegIuck2T2uD5pw79OmJDoS
 I3ByD9Y/KwMKtOGNwingYOtJvj47H6VWDH8Z0lsDlTmMr+lKLqXDisDvqkJadilnc7r6dL2iys+
 VPTlEXMxFsYiZ6HC7BZ/OL7/cKCk/pq8trGspSpUYuUuPLiAdIE5UooA/c6v6Wmn1cl33N4l02F
 jyWzglBegVDhdiApN+pJumdDc2wpc3mY8S0Q+a/Nf31QAEp4tFrQ04cxT6CeqOimdnrre4h/u9r
 cB2v+
X-Received: by 2002:a05:622a:4c0a:b0:517:6afc:b644 with SMTP id
 d75a77b69052e-519e4db674amr55150231cf.47.1781882031950; 
 Fri, 19 Jun 2026 08:13:51 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:517:6afc:b644 with SMTP id
 d75a77b69052e-519e4db674amr55149761cf.47.1781882031416; 
 Fri, 19 Jun 2026 08:13:51 -0700 (PDT)
Received: from x1.local ([174.91.117.157]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-519e60ede74sm22190141cf.25.2026.06.19.08.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:13:50 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:13:39 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 qemu-rust@nongnu.org, Alex Williamson <alex@shazbot.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Fabiano Rosas <farosas@suse.de>, Mark Kanda <mark.kanda@oracle.com>,
 Ben Chaney <bchaney@akamai.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH v5 00/12] Make RamDiscardManager work with multiple
 sources & virtio-mem
Message-ID: <ajVco512NDPKDPTr@x1.local>
References: <20260604-rdm5-v5-0-5768e6a0943d@redhat.com>
 <CAJ+F1CKRvSWDOvKC98e_7uyjgJMuXfhOHP83H0s7a=+ZrYxA1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKRvSWDOvKC98e_7uyjgJMuXfhOHP83H0s7a=+ZrYxA1g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WXQGvTP52e4xTdNFCSXq7Fiv4pauYAD9Ilux0bLXtV0_1781882032
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Fri, Jun 19, 2026 at 12:11:48AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Jun 4, 2026 at 5:46 PM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Hi,
> >
> > This is an attempt to fix the incompatibility of virtio-mem with confidential
> > VMs. The solution implements what was discussed earlier with D. Hildenbrand:
> > https://patchwork.ozlabs.org/project/qemu-devel/patch/20250407074939.18657-5-chenyi.qiang@intel.com/#3502238
> >
> > The first patches are misc cleanups. Then some code refactoring to have split a
> > manager/source. And finally, the manager learns to deal with multiple sources.
> >
> > This has been tested together with the Linux kernel series from
> > Zhenzhong Duan [1] for TDX guests.
> >
> > (help fix https://issues.redhat.com/browse/RHEL-131968)
> 
> Can the patch 1-11 be queued or are we missing something?
> (RFC patch 12 can be dropped for now)

Likely yes.. one thing to double check with you before I do: We don't need
the kernel series, do we?  Since when unplug, I expect with the truncation
approach that this series proposed, KVM will emit TDH.MEM.PAGE.REMOVE then
unaccept is done (?).

Say, what happens if we run QEMU with this series applied, but without the
kernel series?

What confused me a bit is the dependency of this series v.s. the kernel
one.  It seems to use different approaches, but then I don't understand why
this series was tested with the kernel change.

Thanks,

-- 
Peter Xu


