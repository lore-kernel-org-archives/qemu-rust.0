Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E489DCD98CC
	for <qemu-rust@archiver.kernel.org>; Wed, 10 Jun 2026 18:39:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1wXNpe-0004Fs-CU; Wed, 10 Jun 2026 14:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNpd-0004FI-AI
 for qemu-rust@nongnu.org; Wed, 10 Jun 2026 14:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXNpb-0003HH-NT
 for qemu-rust@nongnu.org; Wed, 10 Jun 2026 14:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781116754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJwNW4jNLb07h1epy/AdnMNeLVnkIKT5Qgw/rd9Nvn0=;
 b=agJDveOCp96FM0vyotrVdKw5PN/ej+VURCZztuYgCGlsS3uFnm10JsAswhryKbNUeG8NFm
 mva25w6LC6gC/USIcJz6R0HnsjrTd3NXwtS4Elqfl9ypRsmwwiFWipAllfe4moHR1TBBRk
 GFmZ/rRHGJsci91gvyOAZohFsB7TO5A=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-kcOESxRLP-264jaJqItikA-1; Wed, 10 Jun 2026 14:39:13 -0400
X-MC-Unique: kcOESxRLP-264jaJqItikA-1
X-Mimecast-MFC-AGG-ID: kcOESxRLP-264jaJqItikA_1781116753
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9159bc52211so615561685a.2
 for <qemu-rust@nongnu.org>; Wed, 10 Jun 2026 11:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781116753; x=1781721553;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJwNW4jNLb07h1epy/AdnMNeLVnkIKT5Qgw/rd9Nvn0=;
 b=lZBYMiItiiX7kFXEpXXCUhXJ3DCVvYkxQLD3nwKMwYyppBGHb6fc2xy2JL+kjK/MQr
 MTQ7xfm7mL7tYuf6ZZDDVNdDYlj/ZyJg8qmBRigusHjxKOwh1+NmLlRlZqgRNK/JtlkB
 P5zcpkm+iMmz1Tzd3bgri2B3Dm+Y2/aUdeLcjWHxBGRTDV46BeOL6kl8Bm2QOqbt6eoz
 pu8EY6YX67l5vTZN7yumw5wKPOSbqYC1sMFADvPQE6CJnsjOBC9xIzGHc0Ww9Su1rVFQ
 /p30uVeL3YygywODWrSYcMOYN3kPlBfQy986KkpK1giXUYkMFL34q20cvHFYmzuUH29x
 UtQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/S9+m3jn71rweUXHHiUOE1FGmnX5thSqh/+IZdWtPruMu4AbAaAc39RZX3XXaLPQ7A1AYYvZ1NVIQ=@nongnu.org
X-Gm-Message-State: AOJu0YzzPFGyX3fQ4rIeV0i7+rtSuUl0H6UEpB0RzOiJqxaZbJApXjrR
 hAYbki19g6YebGuJ2Nz6Ea+SHi8b+VpX/tc9dsC5nEAczUrfGzK/oJRYKIjrZb5WrCE95gmEsKm
 sh6EN/V7DUp6o5Oj4iueHZ4zt1XYqZEKNh+aX14VQkZvforMCfLQJdjc=
X-Gm-Gg: Acq92OEYEq9j9ozMNS0ZLHF8yXQTh8pHQOnXOvMCA1bGodqR197j0Id+WXW6K8+jgHk
 vHfduaKV9NUxC9ffLdFptC/i9h/c/qXBkrjLHEFlh8U4LzhOeSF1S2CtYm0gSSF+hhc9z+tWTa3
 DfpmSqZLRLBsqHaUcEu1VdctIPZAmILT25o6izfKO28hBHLfpWJrrPi3Qj0u+1zSgnrW3djtsBO
 HQhTHH2s7H+XH5vuVECoiHO5mzTxQHoB+1vZFDOnV5b+9ltfm1crmukmEGnvoBZZrWphChzVJ1d
 QLqC3H1DKaFC9ab14amCpZWqc8qocKMunlTYR/+zKvw3shvU6DiCrFWsFpmqyNKR0Sy0qS9oO/a
 M22PQC4bs5ar9oknvv6tbbQDVhA==
X-Received: by 2002:a05:620a:2808:b0:912:1:b415 with SMTP id
 af79cd13be357-915a9cdf822mr4378468985a.26.1781116752834; 
 Wed, 10 Jun 2026 11:39:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2808:b0:912:1:b415 with SMTP id
 af79cd13be357-915a9cdf822mr4378461385a.26.1781116752271; 
 Wed, 10 Jun 2026 11:39:12 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9158a37cab6sm2491634285a.22.2026.06.10.11.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 11:39:11 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:39:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v2 05/10] qom: Create object-property-ptr.[ch]
Message-ID: <aimvTYDsv_-Xsboy@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-6-peterx@redhat.com>
 <aimNv51iMZ_yEgDG@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aimNv51iMZ_yEgDG@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qp4Ayzg74Wjo7qABPjxRrj-xzAUHtL38ZvYo8bdnMHc_1781116753
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Jun 10, 2026 at 05:15:59PM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 09, 2026 at 01:25:09PM -0400, Peter Xu wrote:
> > Create object-property-ptr.[ch] files to include all the helpers for
> > object_property_add*_ptr().
> > 
> > These set of helpers are handy because they look extremely familiar with
> > qdev-properties, allowing the caller to provide a pointer and it will
> > manage all the setters and getters.
> > 
> > The follow up patches may introduce more of such helpers.  Since object.c
> > has been already too big, split that part out.
> 
> The "ptr" helpers are all instance level properties which is a concept
> we discourage from new usage, in favour of class level properties.
> 
> I don't think we should be adding more "ptr" helpers, but rather
> planning to eliminiate the (surprisingly little) usage of the
> existing ones.

The other way to do similar thing is qdev's offset way, but IMHO that's
more awkward to remember an offset of a pointer then do math everytime.
Essentially, from technical pov we need at least one uintptr_t to store
either (1) offset, or (2) field pointer when there's a field that is bound
to a prop.  IMHO (2) can be better otherwise we'll need to do all the maths
to calculate offsets then when access we add the offset back and do a force
cast.  It seems not necessary.

OTOH, I still see value on non-class instance properties (that sometimes we
don't even want to have some props avail for the class, but conditional to
some instances when created dynamically).  If that is needed, IMHO it's
fine we still provide per-instance properties.

Is there any pointer I can read about the discussion previously on this?

Thanks,

-- 
Peter Xu


