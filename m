Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D83D2F338
	for <qemu-rust@archiver.kernel.org>; Tue, 13 Jan 2026 15:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1vfgfH-0000ww-Ml; Tue, 13 Jan 2026 10:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfgex-0000jJ-9N
 for qemu-rust@nongnu.org; Tue, 13 Jan 2026 10:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vfgeu-0001WN-Pe
 for qemu-rust@nongnu.org; Tue, 13 Jan 2026 10:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768319408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndEmw4g/ZuE1/CdlLZLbhydeH5EmsyvdNFcwRbzgOws=;
 b=N+Jb5gLMvbhCqbvvr2Gx9LRaLsTwiF9wBQ6AxMXl2NuByJNELc86gMQzYMVe39AG+IbCdE
 hY/VDhwGYuD+BXXOsVUXaRhaYb8Nvl5pIX0r7cSlyWP5ZmQ/+4+KvR6fGqsEwXQRLgmFkw
 YRPBJN1rJdl0btI2UxnCcmWj33g1MkA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-e1bNGvihMfGk9MCzmv2SnQ-1; Tue, 13 Jan 2026 10:50:07 -0500
X-MC-Unique: e1bNGvihMfGk9MCzmv2SnQ-1
X-Mimecast-MFC-AGG-ID: e1bNGvihMfGk9MCzmv2SnQ_1768319406
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430ffc4dc83so6367925f8f.3
 for <qemu-rust@nongnu.org>; Tue, 13 Jan 2026 07:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768319406; x=1768924206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ndEmw4g/ZuE1/CdlLZLbhydeH5EmsyvdNFcwRbzgOws=;
 b=Z+J+XEZFfYumZm+ShclR40O3LMHZooai9B8DNbxUnrWace593E8O36K2E+HjUfRSLB
 7UCsq34IFDHamod7oTGZiosVMaYs/uSogBoeItfVMMJCabXlHAv4bT+5ELCEz6Q6u4NU
 G5/FnPKvICXi+NXii4vEHdDIdbv4ePIfyqF8mvQZYrNDmsPIEeRG7xa0sh45PZFed/Hy
 ufm/1txGCOUuY5nxkK1ndJoQvEFGOdU2r7fByv3KSc3blU9kisSpQuPu65o1TV8cOvTH
 00QU5ed2tL3XZmmcDTgJJ+wDLYqPegm/1KOuKjmUO2V2j9sZbRiIuRvzOgXYPF3FcIoq
 aJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDWUiTd2xdmrN/z6iM2KotKjK+rrBC8m7/NS5js5u+2wcpSotVkXUmW/hEBM/y3v1dl37SVSe2IS4=@nongnu.org
X-Gm-Message-State: AOJu0Yz0npwCQmmwL/rIzKrDh/cs2mUjO3aQJhyuWJAbNNPIJNoiPXR4
 DbyOQzjSTpj+O9lNlKWsEEcoq0Tw2J4B70Q/I8FDfodqvHeKxUKlbn/HwMEHgk4a+ycdIorJFdm
 BHRp8sYJjW4c/Ea6PAFquIQ4t9fCK5GA9wkRSGpuys9oxjLY+KZG7vOfKGrH+TVaUN3WNbJsxEt
 JqljwsqLvCWN4av4d60zBQ9OimyC2j7g==
X-Gm-Gg: AY/fxX4O5IKHpQTVCOodcAifQiSIBN9rIKfs++XweKrT4Ib2oY6VhzyEFwNQL0GzKjV
 +0mWinaGtRQfpQdu6Jy51WcqH5qGbLiXTDzXl88zJTXzTWjmBM35EMWD0bfXzn33IZGcG9JV9cg
 zqEvlqnO5Yz898RybrqFvP2vVscfKrDDkwFacjo6HsR74CaBxENxHnBkNfn24jI4xu5O+yIJUSG
 Y5AZub6BkKzeI6c/sG81eo+9ANGarRLd5MQnrMEe4lqrFTWO5kgwzaigbWndoZgS6nQDw==
X-Received: by 2002:a05:6000:238a:b0:430:fced:90a with SMTP id
 ffacd0b85a97d-432c3760d4cmr26123913f8f.16.1768319406329; 
 Tue, 13 Jan 2026 07:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVB2rWEQQWR/Jq1azGMwwjAdqBLb5M0oTyq0PCUIQykyaD2RXZlIO29GCXJpBJlJp5pmxf9dw7AMKx70CS+ik=
X-Received: by 2002:a05:6000:238a:b0:430:fced:90a with SMTP id
 ffacd0b85a97d-432c3760d4cmr26123877f8f.16.1768319405938; Tue, 13 Jan 2026
 07:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20260108170338.2693853-1-berrange@redhat.com>
 <20260108170338.2693853-9-berrange@redhat.com>
 <878qe1c17b.fsf@pond.sub.org> <aWYXt9YckvZmFCia@redhat.com>
 <874iopacr0.fsf@pond.sub.org>
In-Reply-To: <874iopacr0.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Jan 2026 16:49:53 +0100
X-Gm-Features: AZwV_QiXchD8DiYzifTQEGMr3oFq1UaSTq4omJHE0OLd82qR1w-O_XiXPZeB8sQ
Message-ID: <CABgObfYdw9y3621wHkBT+htB8cQ=OsUMdBFJYEoJiuaDELLzUw@mail.gmail.com>
Subject: Re: [PATCH v5 08/24] util: add API to fetch the current thread name
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 devel@lists.libvirt.org, qemu-block@nongnu.org, qemu-rust@nongnu.org, 
 Stefan Weil <sw@weilnetz.de>, Kevin Wolf <kwolf@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mEcWx01O7wxyalm69sNKJsKsm6mF8mVclqcdMFGFUV4_1768319406
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On Tue, Jan 13, 2026 at 2:00=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
> > > Tempted to store the thread name in TLS and call it a day.
> >
> > Using the official APIs in this way ensures that the thread name is
> > visible outside QEMU. For example when debugging in GDB, which IMHO
> > is an important benefit.
>
> I didn't mean to suggest not to set the "official" thread name.
>
> This patch retrieves the "official" thread name back.  Takes a bit of
> system-specific code, including Meson magic.  We could instead hold on
> to our own copy, and just use that.

Yes, I think that's what we're going to do anyway due to my remark on
patch 7/24.

Paolo


