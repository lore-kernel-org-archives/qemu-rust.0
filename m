Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uJuR4-00087d-H3
	for mharc-qemu-rust@gnu.org; Tue, 27 May 2025 09:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uJuR3-00087U-69
 for qemu-rust@nongnu.org; Tue, 27 May 2025 09:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1uJuQz-0001sp-32
 for qemu-rust@nongnu.org; Tue, 27 May 2025 09:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748352812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vud3oGLcPRjsQnvbfOwquNv1Y3rH0EY+1UcE3ep9Mzo=;
 b=DX+ZKrPVouy/Ci9eeauKccwWLW1dJuzV+FwIVkWaTL5mRcPUarN2Hucw9Qw7ZSaRmbNBjx
 ZdkGCguXalwpUbkob4+/gNBou+bKsix/fS/MSvLeNU9zWOQUmTkMQ46K82dfnRMxKJ2GKr
 eaQexoqCFMv0QCxwOW+hYXyS3GRtIsk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-qKJ2LCOnOtii_R_EGWQTOg-1; Tue,
 27 May 2025 09:33:31 -0400
X-MC-Unique: qKJ2LCOnOtii_R_EGWQTOg-1
X-Mimecast-MFC-AGG-ID: qKJ2LCOnOtii_R_EGWQTOg_1748352805
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1AE061800258; Tue, 27 May 2025 13:33:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.2])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C33E91956095; Tue, 27 May 2025 13:33:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1228A21E66C3; Tue, 27 May 2025 15:33:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-rust@nongnu.org
Subject: Re: [PATCH 04/12] util/error: expose Error definition to Rust code
In-Reply-To: <20250526142455.1061519-4-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 26 May 2025 16:24:47 +0200")
References: <20250526142254.1061009-1-pbonzini@redhat.com>
 <20250526142455.1061519-4-pbonzini@redhat.com>
Date: Tue, 27 May 2025 15:33:22 +0200
Message-ID: <871psanpp9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 May 2025 13:33:41 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> This is used to preserve the file and line in a roundtrip from
> C Error to Rust and back to C.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qapi/error-internal.h | 26 ++++++++++++++++++++++++++
>  rust/wrapper.h                |  1 +
>  util/error.c                  | 10 +---------
>  3 files changed, 28 insertions(+), 9 deletions(-)
>  create mode 100644 include/qapi/error-internal.h
>
> diff --git a/include/qapi/error-internal.h b/include/qapi/error-internal.h
> new file mode 100644
> index 00000000000..d5c3904adec
> --- /dev/null
> +++ b/include/qapi/error-internal.h
> @@ -0,0 +1,26 @@
> +/*
> + * QEMU Error Objects - struct definition
> + *
> + * Copyright IBM, Corp. 2011
> + * Copyright (C) 2011-2015 Red Hat, Inc.
> + *
> + * Authors:
> + *  Anthony Liguori   <aliguori@us.ibm.com>
> + *  Markus Armbruster <armbru@redhat.com>,
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.  See
> + * the COPYING.LIB file in the top-level directory.
> + */
> +
> +#ifndef QAPI_ERROR_INTERNAL_H
> +
> +struct Error
> +{
> +    char *msg;
> +    ErrorClass err_class;
> +    const char *src, *func;
> +    int line;
> +    GString *hint;
> +};
> +
> +#endif
> diff --git a/rust/wrapper.h b/rust/wrapper.h
> index beddd9aab2f..6060d3ba1ab 100644
> --- a/rust/wrapper.h
> +++ b/rust/wrapper.h
> @@ -60,6 +60,7 @@ typedef enum memory_order {
>  #include "hw/qdev-properties-system.h"
>  #include "hw/irq.h"
>  #include "qapi/error.h"
> +#include "qapi/error-internal.h"
>  #include "migration/vmstate.h"
>  #include "chardev/char-serial.h"
>  #include "exec/memattrs.h"
> diff --git a/util/error.c b/util/error.c
> index 673011b89e9..e5bcb7c0225 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -15,15 +15,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> -
> -struct Error
> -{
> -    char *msg;
> -    ErrorClass err_class;
> -    const char *src, *func;
> -    int line;
> -    GString *hint;
> -};
> +#include "qapi/error-internal.h"

Please move this up to keep the #include sorted (except for
qemu/osdep.h, which is special).

>  
>  Error *error_abort;
>  Error *error_fatal;

Since error.h is always included when error-internal.h is, we could make
error-internal.h include error.h.  Matter of taste, up to you.


